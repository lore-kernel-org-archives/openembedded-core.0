Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RJhWh-0007Lc-7v
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 10:10:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9S84qZE017738
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 01:04:52 -0700 (PDT)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 28 Oct 2011 01:04:52 -0700
Message-ID: <4EAA6163.2090204@windriver.com>
Date: Fri, 28 Oct 2011 16:01:39 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Originating-IP: [128.224.162.146]
Subject: Seek help: keyboard can't work after updating xserver-kdrive
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
X-List-Received-Date: Fri, 28 Oct 2011 08:10:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I am updating xserver-kdrive_1.7.99.2.bb to 
xserver-kdrive_1.11.1.901.bb. Keyboard can't get action on 
matchbox-terminal.

I make a test like the following steps on matchbox-terminal with 
matchbox-keyboard(virtual keyboard):

sh-4.1# cat /dev/input/event0

The screen show some messy code when I type words on keyboard.
sh-4.1# cat /dev/tty0

The screen show words normally when I type words on keyboard.

So I don't know what cause that keyboard can't work on matchbox-terminal 
when typing words.

Who can give me some suggestion? Thank you  very much if you can 
provide  your experience to me.

Thanks
Yan


