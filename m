Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U8UvS-0000s0-EW
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 13:07:02 +0100
Received: by mail-ob0-f180.google.com with SMTP id ef5so8824510obb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2013 03:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=vc4eGBOEWU/mbThpxhYMCtM09jXeGZ6C4958A178ZhE=;
	b=rO6z4NjsBwpb6oHncSgn3wA41/WMyxSO2yUNJvQ60LInb3J2NVKdvQ0NEcv2cUQ0dB
	nNeBOVWAD5ffww6KCVXgsmV0sAzy9cWanblJ+SvyYoGu6jdLb9NX+WoqwDl2UlIGqvcm
	8yWaEWJ3M0NpnR4lvlp8RCucsmJF1sTV27volS9Bpxu8FN8+oQSGXAy3Z3rWb74hC5w4
	vLS+YGXyV4eLyNk7aiCA5GtfogyVm0BLh1F5NHo4jn62YfDX4Zo1kYzNC/sn2KDH6AC2
	WTgEJDsrMD33W9fP+/71IKJRo+bLzEaDc2QTs7PhpeIFVwyS4OPniyp4agPZ+QWCWQA8
	Qyfw==
MIME-Version: 1.0
X-Received: by 10.182.127.7 with SMTP id nc7mr6506108obb.94.1361447445776;
	Thu, 21 Feb 2013 03:50:45 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Thu, 21 Feb 2013 03:50:45 -0800 (PST)
In-Reply-To: <ly7gm12948.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
	<CAP9ODKq_XBobE5vCOCCSgusT9RQyY3VSbUZmR9yAcQ4eFkKLBg@mail.gmail.com>
	<1361019187.31795.49.camel@ted> <20130217231955.GF3300@jama>
	<lyd2vydizm.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LbAmTuj0dZKq7=wX5uqF9OV7dW7FXd4d2incdKSshXEmQ@mail.gmail.com>
	<lybobe0xbv.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaSGjxG4vZ01jR63UTjoFL3+FNv+mRS3K5X6p5ugodD=Q@mail.gmail.com>
	<ly7gm12948.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Thu, 21 Feb 2013 08:50:45 -0300
X-Google-Sender-Auth: Azeo7KXagxUQOu5ZsD7_QfJpCDA
Message-ID: <CAP9ODKrt4yGaOvnsqtOLT52eDb99G7UBBVBTYZerNn-5MHA-Eg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Thu, 21 Feb 2013 12:07:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 21, 2013 at 8:34 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> "Burton, Ross" <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> writes:
>
>> more upstream over time will also integrate systemd unit files
>> directly.
>
> When in 5 or 10 years everybody switched to systemd and installs its
> service files by itself, we can mark the relevant code in the class as
> deprecated and remove it.
>
> But now, the oe-core systemd implementation causes redundant implementations
> of non trivial code in several packages.

I fully agree; we have many cases where classes workaround system
issues/limitations to avoid code duplications so I see no reason why
this needs to be different with systemd.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


