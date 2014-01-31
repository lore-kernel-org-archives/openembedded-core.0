Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 453456E9A9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 22:48:01 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id uq10so409048igb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 14:48:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vKVzAdOh5yj/SFcD3VqQp4hTkQWYzDE2FOu2jDCnjRE=;
	b=JyDEJsJB/e3Suk03WRtiIVg6VCZR8dK2PQidiv9+qpCllWgpGUKORPoahnmaFZFytW
	4aKWLbVgYcFUUUk5EuZx9FQewzrZLdYUqjXYC7CueQ3fgx1CaIExT5TbeC4lZqLvzNwh
	hYr3ioHVqO2WSF8aKqKiqEejGr0qCTxajA0K8GXCuEe4etZls1ia3kxaejiIMNyRS0Uq
	bm068Gfr8RbFvmHImEkkqR7kXNUaEhY0X/ibJSK2TXr4fWjq2cZrFlBRRvx8crVJdzs/
	CYdQOZoJ/RnFPEP67dCFlnTBrpL2IymWEyjFIOZ6jtFiOVMCjKxCd+bNbcI98ZKowo7z
	JD/Q==
X-Gm-Message-State: ALoCoQkUNS9t1MYuvlpELnK0RHusV23h8WJl2meIK95Lu+OkkxqvLbcNfvH847O2cmyPPpjAUQiU
X-Received: by 10.50.147.72 with SMTP id ti8mr959833igb.20.1391208482319;
	Fri, 31 Jan 2014 14:48:02 -0800 (PST)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id y9sm1823327igl.0.2014.01.31.14.48.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 14:48:01 -0800 (PST)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2014 17:47:35 -0500
Message-Id: <1391208456-23049-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.8.5.2.227.g53f3478
Cc: patches@linaro.org
Subject: [PATCH 0/1] scripts: add get_maintainer script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jan 2014 22:48:01 -0000

This patch imports the Linux kernel's "get_maintainer.pl" script for use with
OE/Yocto layers. The purpose of this script is to make it easy for people
submitting patches to determine a sensible list of people to CC. Ideally all
layers include valid MAINTAINERS files, in which case a valid MAINTAINERS file
will be parsed for a list of potential people to include. But even if such a
file does not exist, the "get_maintainer.pl" script is able to use the git
history to create a sensilble list of relevant people who might be interested
in changes to parts of various files a given patch touches.

Invoke this script with "-h" or "--help" to get a detailed description of the
various things this script can do.

This script was modified in a couple minor ways to fit in with the OE/Yocto
ecosystem. For example, the original script assumes the presence of a
MAINTAINERS file; unfortunately not all layers (very few, in fact) include
such a file. Also, it is not possible to assume all layers include a known
file at a given location (i.e. to make sure the script is invoked from a valid
OE/Yocto layer). For example most layers include a "conf/layer.conf" file, but
some "layers" (such as openembedded-core) are containers for further
sub-layers. Therefore this "location checking" logic had to be left out.

If you would like to automate the processes of adding relevant CC's to your
"git email"'s, simply add a "cccmd = get_maintainer.pl" line to your
".gitconfig" file and the CC's will be added to your emails automatically.

Trevor Woerner (1):
  scripts: add get_maintainer script

 scripts/get_maintainer.pl | 2140 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 2140 insertions(+)
 create mode 100755 scripts/get_maintainer.pl

-- 
1.8.5.2.227.g53f3478


