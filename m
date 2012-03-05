Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S4S1p-0005RL-UE
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 08:08:18 +0100
Received: by lagw12 with SMTP id w12so4452725lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2012 22:59:43 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.152.122.74 as permitted sender) client-ip=10.152.122.74; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.152.122.74 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.152.122.74])
	by 10.152.122.74 with SMTP id lq10mr19249638lab.7.1330930783619
	(num_hops = 1); Sun, 04 Mar 2012 22:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=OFr3cq4zceZ3T+NrG9BdNzNiY6uxewNRTaXqBsyQAjc=;
	b=OTCbzJx34Cx0tykqvG9wGHfThSvty6OGQ0rooUcuFhM7NzGrpWOIQuHCgxL58zob9y
	bQkFcncCyczn3EflM5EXOvTbhz5UA8a2O0u/T8d6pri/PToVlh0pXDedRmjEBEAB84oA
	NL21sqcLzca/YAAsgYqoPfrv8uHnbc8sXzlwwALrJ1huYz+eLwXN16rdFDBd/eZ0gtmg
	dw3YRCl5YJvy02feqsReUTao1yIEE73QiFjjAXqhXq3smaW9YSF5xI5umaVcUWUMr6pi
	m75S5WVrF/jeZUavnb83bLC/lavFUrY8cxL0jY2xDD4hS0JesXqV8oChY0BmSB0EzNi6
	p1Ng==
Received: by 10.152.122.74 with SMTP id lq10mr15770739lab.7.1330930783491;
	Sun, 04 Mar 2012 22:59:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Sun, 4 Mar 2012 22:59:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Mar 2012 22:59:13 -0800
Message-ID: <CAMKF1sqgtVAabFSJ0L0W6DPrvWw8xwHTezJbiVJg3ARVyf8Aug@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: gcc -4.7 available for testing
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
X-List-Received-Date: Mon, 05 Mar 2012 07:08:18 -0000
Content-Type: text/plain; charset=UTF-8

Hi OEers

Since gcc-4.7 branch has been started I have prepared initial set of
recipes for it which are here

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-4.7

(You need the top 3 patches really)

It can build sato images and minimal images in OE core for all
supported qemu machines

GCC test results are here

http://sakrah.dontexist.org/files/gcc-4.7-tests/

if you are using oe-core settings then you need is set

GCCVERSION = "4.7%"

in local.conf

Enjoy

-Khem


