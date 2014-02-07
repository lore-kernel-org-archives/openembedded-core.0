Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8B3816E8CF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 19:09:43 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wm4so4533414obc.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2014 11:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=kTI6Rtp70BzQEX/6CDcaEDgg0jbvknav2BGGDFO6QME=;
	b=LdMirRTkYqpbxWyCHlkYDrVR0mRP6WIX4CmGmtK6OgsPdleR0iyNU4NrHYccVZtTYa
	C0NGMKvwwLwJTtU1gO1OOfo3I8cxmIBVbzQLoWxXo31QAoxVuGpJJ9LEW/T+AN5/qCNC
	jHWE7IuvjQWgGrpNBnP7aUk3tRminFSKKRXDme2fiHzRoL5XWGJzGlLKuq4ZD6PEzHkM
	1hXmjqH9CkYv7xHXrOQAdLIeh8Ui44pMH1AB1+8/igwxCqnzJ2DkZG9JKYPh4QSzGQlt
	pSEfuSoogMrA8NDrdqtF3nJa8ofDwpAaMyXh2pYVsCsjpdv54z9bclnVNVLp9YoRhkmZ
	IDDg==
MIME-Version: 1.0
X-Received: by 10.60.44.42 with SMTP id b10mr3111989oem.70.1391800184068; Fri,
	07 Feb 2014 11:09:44 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 7 Feb 2014 11:09:43 -0800 (PST)
In-Reply-To: <52F50D1C.2080200@windriver.com>
References: <1391790632-29801-1-git-send-email-alexandre.belloni@free-electrons.com>
	<52F50D1C.2080200@windriver.com>
Date: Fri, 7 Feb 2014 17:09:43 -0200
X-Google-Sender-Auth: W2DKd-9KSoGK8JpIEERV27QjN-k
Message-ID: <CAP9ODKq=SvUE_K0Wt91txdHgcDZCbXE0OLhEaH_GkJxq+Z-=Qw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Darren Hart <darren.hart@intel.com>, Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] kernel: use oldnoconfig before yes '' | make oldconfig
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
X-List-Received-Date: Fri, 07 Feb 2014 19:09:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 7, 2014 at 2:43 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 14-02-07 11:30 AM, Alexandre Belloni wrote:
>>
>> When using a defconfig, using yes '' | make oldconfig may not result in
>> the correct configuration being set. For example:
>
> Thanks for your patience, v3 looks good to me. Obviously RP will
> over rule as he sees fit :)
...
> Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

