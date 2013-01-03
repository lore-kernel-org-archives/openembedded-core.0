Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TqsUL-0005Sd-5V
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 22:38:11 +0100
Received: from mail-wi0-f198.google.com ([209.85.212.198])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 03 Jan 2013 13:23:03 -0800
Received: by mail-wi0-f198.google.com with SMTP id c10so14718583wiw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 13:22:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:date:from:to:cc:message-id:in-reply-to
	:references:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=/l+o4DUR1uUZY45MyO3CxgGDakjV4kkhgxLQjHj/YbY=;
	b=LZ6IpZIuij3qGheGm1yI6pWRWCK9VYKwCIuNdtmIPMTF9CfL3vRGs6ROZsbMete24z
	W5x8Jq0PlQdQFEWuSLbAzyNZitp00aryOVfXq5gJa0ovauIszJv939ayh3QUaIjrH+Ql
	iR+Cys/ZtxnHTBLs8nsnfuXJRX3r0SxOyPTSR/ZLP0fYwoCYMWoVpOt5g3/TwbLk7mkK
	jebirc9H6yetYFz5+o7o18hJxk0XoNY8KXlMdY0P909bHEExIx43BihhbNRsvOPU2Lmy
	6MsrwUvxFOye6smdBT42JF++gLkUmVoN1G7/xaUsh1f24nC65meJjb+7axOl4NkF29GZ
	tfFg==
X-Received: by 10.194.19.10 with SMTP id a10mr80507608wje.45.1357248177615;
	Thu, 03 Jan 2013 13:22:57 -0800 (PST)
X-Received: by 10.194.19.10 with SMTP id a10mr80507600wje.45.1357248177486;
	Thu, 03 Jan 2013 13:22:57 -0800 (PST)
Received: from [192.168.1.13] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bd6sm60034111wib.10.2013.01.03.13.22.55
	(version=SSLv3 cipher=OTHER); Thu, 03 Jan 2013 13:22:56 -0800 (PST)
Date: Thu, 3 Jan 2013 21:22:53 +0000
From: Ross Burton <ross.burton@intel.com>
To: Marko Lindqvist <cazfi74@gmail.com>
Message-ID: <160EE236CFD44F58901B43D12D55934D@intel.com>
In-Reply-To: <1357245391-11055-6-git-send-email-cazfi74@gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-2-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-3-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-4-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-5-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-6-git-send-email-cazfi74@gmail.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQlR/q1w7MUku9E+dmdEgDB4J+UcUA1aixRLENSO5uT+88xV3h5XvXzdnEtANLRJn1hwDqRKP/Gk//UzU1We3kxO+lLHLB/YwRaIcbWOZZuniuXdFWA0Rjv5VsuHrX8/JSO4d23Th+1ppqh4VeYiRiQUdKY0atwtuq++BT8qvegaKbUdZoNn9G9Kb2lrO19ydW8yjL9C
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/15] popt: disable tests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jan 2013 21:38:11 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday, 3 January 2013 at 20:36, Marko Lindqvist wrote:
> Use of $(top_srcdir) in TESTS is an error causing automake-1.13
> to abort. Disable the tests completely.
> +Upstream-status: Not sent

Is the real fix as simple as removing the $(top_srcdir) line, or is there a more complicate reason as to why we can't fix this properly and submit it upstream?

Ross 




