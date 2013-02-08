Received: from mail-oa0-f50.google.com ([209.85.219.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U3mzC-0006ye-5j
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 13:23:25 +0100
Received: by mail-oa0-f50.google.com with SMTP id l20so3872968oag.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 04:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=RvvX5Fz+KtsOqs4hmU3Xaav0w42sSZ+e4PNUAkUXDss=;
	b=IWET/1X5LSd1fOn9gyEbuAGiCkPTA/v3Z1c5zkM9KfvunooJ2Xb26+7UBtWDE6KJ+D
	bmhLieD3KTyKH0YHbmVw5RL0JGRQUXIfe1tvG6qsg48kWYrpKuwkNhn2qnNSO6ndqfB6
	KoVkfacZzcMC+YjWayRvXEWA94O1D5PPDFbyxVAbE2beERf/V1Lq0gZ9qtICyGoEeREc
	wd6qe7LAIrCWt4uNLxk6TCSf+Bpw0ZgrQFivIlTM3D4RcBUHZ4yuHLfy/F4nE3VFcFUT
	ioxDiO5KZoL3jESbTtFTJkvb0oLgc8sA4UfDfjWCA3jqYCspeOGu2tN7ePora2f4VwW+
	y0Uw==
MIME-Version: 1.0
X-Received: by 10.60.170.44 with SMTP id aj12mr441742oec.42.1360325247926;
	Fri, 08 Feb 2013 04:07:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Fri, 8 Feb 2013 04:07:27 -0800 (PST)
In-Reply-To: <5114E8E5.70203@r-finger.com>
References: <1360323133-28592-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LaOcn5Kr64Ga7zfuP5q1ixO8Ag4Uy+JrOmDe7AEhDDmpQ@mail.gmail.com>
	<CAP9ODKomOChKyoVD=-O9vNpnRFSyj+N+bz8C=mSLV3rky-hD2Q@mail.gmail.com>
	<CAJTo0LbOcirp-VJT1u9g9Xp8jTREb=UD+dJRftidVpt6tQ3HRg@mail.gmail.com>
	<5114E8E5.70203@r-finger.com>
Date: Fri, 8 Feb 2013 10:07:27 -0200
X-Google-Sender-Auth: p5Am62num5pjf4NiV6GPApJ1dSM
Message-ID: <CAP9ODKqRoNRNKqeZ6AyLd_ALjVu3Zo-7ZDtsmmvdj=m5CGwQWQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata: We shouldn't override the localtime if it is valid
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
X-List-Received-Date: Fri, 08 Feb 2013 12:23:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 8, 2013 at 10:00 AM, Tomas Frydrych
<tf+lists.yocto@r-finger.com> wrote:
> On 08/02/13 11:55, Burton, Ross wrote:
>> On 8 February 2013 11:38, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>>> Can you fix the code to symlink instead of copy?  systemd and more
>>>> needs a symlink so that it can identify the name of the timezone from
>>>> the link target.
>>>
>>> You mean inside the if?
>>
>> I mean in general /etc/localtime should be a symlink and not a copy.
>
> /etc/localtime is a real file so that /etc is not containing a link to a
> file in /usr; this has historically been the case unless I am not
> mistaken. systemd should grow up and read the contents :).

In fact a lot of software expects it to be a symlink so it shouldn't be a copy.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


