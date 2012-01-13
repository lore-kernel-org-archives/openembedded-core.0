Received: from bluegiga.fi ([194.100.31.45] helo=darkblue.bluegiga.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Lauri.Hintsala@bluegiga.com>) id 1RlbLj-0007rH-J6
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 08:14:55 +0100
Received: from [10.1.1.28] ([10.1.1.28]) by darkblue.bluegiga.com with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 13 Jan 2012 09:07:25 +0200
Message-ID: <4F0FD82D.80405@bluegiga.com>
Date: Fri, 13 Jan 2012 09:07:25 +0200
From: Lauri Hintsala <lauri.hintsala@bluegiga.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.24) Gecko/20111108 Lightning/1.0b2 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326067422-30771-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1326067422-30771-1-git-send-email-andrei@gherzan.ro>
X-OriginalArrivalTime: 13 Jan 2012 07:07:25.0102 (UTC)
	FILETIME=[009C84E0:01CCD1C2]
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH] busybox: defconfig modified in order to activate CONFIG_EXPR_MATH_SUPPORT_64
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
X-List-Received-Date: Fri, 13 Jan 2012 07:14:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello Andrei

On 01/09/2012 02:03 AM, Andrei Gherzan wrote:
> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>
> Enable 64-bit math support in the expr applet. This will make
> the applet slightly larger, but will allow computation with very
> large numbers.
>
> [YOCTO #1767]

This bug should be fixed already:
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014487.html

Please inform if my fix doesn't work.

BR,
Lauri


