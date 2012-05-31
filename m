Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sa9WI-0004O8-JO
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 19:50:46 +0200
Received: by wibhn14 with SMTP id hn14so4182756wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 10:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=XcQx1yPaj4HEYx7I0RHkX9KmVydJYbCiMRxY1T3dHS4=;
	b=DDkkUGYNy4K3Hf+jTEo6Wz4cQD3d2KLBimdMPOUXU4aB3eMjDiW8FLHajDEblqPsdq
	dTVjxTw0KrgihnfRfgLxzhC6MZlY0X4GJ1ebyznvGWqgvnUzwIRJgvxjGP/wsEnE+ADH
	igtk47Uo/P3xGM/POUe5uVleMtNqfucEXqg4+9aqQ3NpPn6z3JjdU8ztKx3cY7vP/xvr
	mmY9wTa/r9vQ6BUofJZENYOIqOcepDyJoRA63cC336ssAL9YiVkPsIKIK2AUh7mw0fTD
	JksZnFGNWli5ahFEfLKynBRJaDYQ6kJVVyPnaQ/rtpjm+d4Nmmbu1TNPuFU+UUPa10Jy
	WTEg==
Received: by 10.216.136.155 with SMTP id w27mr12980422wei.43.1338486024463;
	Thu, 31 May 2012 10:40:24 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id et10sm4913316wib.2.2012.05.31.10.40.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 10:40:23 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <72EA6980-26CF-4ABB-A6F9-9CD5F555EBEB@gmail.com>
Date: Thu, 31 May 2012 19:40:27 +0200
Message-Id: <F243C528-1700-497D-A358-B43DB67CE753@gmail.com>
References: <72EA6980-26CF-4ABB-A6F9-9CD5F555EBEB@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
Subject: Re: [meta-xilinx] WARNING: QA Issue: bash & shell scripts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 May 2012 17:50:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

On May 31, 2012, at 7:38 PM, Elvis Dowson wrote:

> I've found the following warnings while attempting to build =
linux-xilinx. How can I trace which package it's originating from and =
what can I do to fix it?
>=20
> WARNING: QA Issue: bash: Found a reference to /usr/ in =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/bash-4.2-r2/packages-spl=
it/bash/bin/bashbug
> WARNING: QA Issue: Shell scripts in base_bindir and base_sbindir =
should not reference anything in exec_prefix

Sorry about that silly question, its originating from the bash-4.2 =
package. What should I do to fix it?

Elvis Dowson=


