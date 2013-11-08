Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 569406D7F2;
	Fri,  8 Nov 2013 11:58:16 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id e14so3063973iej.11
	for <multiple recipients>; Fri, 08 Nov 2013 03:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=LbTfqtMKH6D3msqDySiitcvVyZ+Mo7Uz3cYG6jRClyg=;
	b=gr0cGniIS/192FNUqQLh84IBnXjZ52fNh1LAlcxzOOCpRpsCrIa2mlqN0VHel98IZY
	sB/d4qr5fs6gMz37YH8DZihB9FGLIn4sbZ7CrYGlmRWl8GId92It3Eb0nOLikblWo+aX
	ky1GbyprLLbCWhPcdlzJYmItlYcsywn8A+DbhssHBaXI6/vCUCI78arXj0i6Ra0kQFkr
	uT0Rrt71bJ4JiYzY+lRVqjqI4kf0t5aC+fq+biDOytGTXBtYUqAkf4jjbfF1kV7r+DTB
	zlN3fi5Pd9tFp+GueFIOu7JiU6Id1LfExS4MhteKpRQjWHtGveTnMYysncRchMjpYL97
	j4RQ==
MIME-Version: 1.0
X-Received: by 10.50.45.100 with SMTP id l4mr2038687igm.8.1383911897947; Fri,
	08 Nov 2013 03:58:17 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.64.20.229 with HTTP; Fri, 8 Nov 2013 03:58:17 -0800 (PST)
In-Reply-To: <1383904061.6271.297.camel@ted>
References: <1383866326.6271.286.camel@ted>
	<CAJTo0LYq5PmQtBdwghmDGLs2ccTO6BBwJNGw7s37Yt+zjkWU6Q@mail.gmail.com>
	<CAAQYJAuMoE6gOMmM2trSN1MY7weCF+07JAJuhQu1K=p5KxO=Yg@mail.gmail.com>
	<1383904061.6271.297.camel@ted>
Date: Fri, 8 Nov 2013 09:58:17 -0200
X-Google-Sender-Auth: UwKkfcuQXmqKqTn_tRRGghNaMRo
Message-ID: <CAP9ODKrQzWnms1L5L7e=i1jygmS_vZ15EAUom_qjq+e8GTTBtg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Default DISTRO to nodistro
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
X-List-Received-Date: Fri, 08 Nov 2013 11:58:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 8, 2013 at 7:47 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2013-11-08 at 10:33 +0100, Andrea Adami wrote:
>> On Fri, Nov 8, 2013 at 10:25 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> > On 7 November 2013 23:18, Richard Purdie
>> > <richard.purdie@linuxfoundation.org> wrote:
>> >> +DISTRO ??= "nodistro"
>> >
>> > Wouldn't "oe-core" be a better name, considering that's what
>> > DISTROVERSION becomes if DISTRO is unset?
>> >
>> > Ross
>>
>>
>> Agreed, we already have DISTRO_VERSION = "oe-core.0"
>> This sounds also the right name for THE default distro.
>
> I disagree and I feel quite strongly about this. OE-Core is not a
> distro. The whole idea was that OE-Core should build with sane defaults
> without any distro set. This is a dummy placeholder value and it really
> does mean to say that no distro is set.
>
> We did put a value into the DISTRO_VERSION field so you could tell what
> was being used but again its a placeholder.
>
> So in my view "nodistro" is clearer about what is meant.

So we should drop DISTRO_VERSION or use 'no-distro.0'

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

