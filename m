Received: from mail-oa0-f53.google.com ([209.85.219.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tvmkm-0003DK-Vp
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 11:31:26 +0100
Received: by mail-oa0-f53.google.com with SMTP id j6so2389334oag.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 02:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=l/SmSSaNsObkXLr2koXrYGXTcpkKLfIWiW/smjSb6ck=;
	b=YX2hg4/J73dxocgy+TJPLQCgAFkdD6bYKGJixOz/jLfRoR45NlZtlKVEZ0dXks8Boy
	lJjiOzUoKHkW1sd29ww3wAFS01aLI9z56XAsWlYwIiqVfDu0ADaudRayLyeZ1rrNob24
	C9qWJi7ilxmZcIcKh+otpel5pE75ZpMoQT5mlqrc4+H3Zl14/XuSXbsuV8fiu8fS30wf
	2D6rmWRiN6kvmpP6u5VhPOStnqE6h9VmSskf6gav9q3Nwf8guEDZ3FO3vxyP4YOIh5OV
	QRRa3IP6OI33+HLCiIjavV1yduYUlOirfeHJSVW7zIiCEOJO8JyRFUnCkUa/CWBio0pL
	lsPw==
MIME-Version: 1.0
X-Received: by 10.182.3.163 with SMTP id d3mr3476525obd.27.1358417761554; Thu,
	17 Jan 2013 02:16:01 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Thu, 17 Jan 2013 02:16:01 -0800 (PST)
In-Reply-To: <CADkTA4PHFrXbLL24Fwvz+WSux4X2aX-JQ035HZLM40Fr_bndag@mail.gmail.com>
References: <CAP9ODKoRws=EzHxyNumYnj-F2S5h_66wkCfL42-yrJK7KGYBOQ@mail.gmail.com>
	<20121216185215.GE3448@jama>
	<CAP9ODKq7C0-Ntnehdo3qK7QsptD8B_8X0UCaMmjCR+jT8vxBAg@mail.gmail.com>
	<CADkTA4PHFrXbLL24Fwvz+WSux4X2aX-JQ035HZLM40Fr_bndag@mail.gmail.com>
Date: Thu, 17 Jan 2013 08:16:01 -0200
X-Google-Sender-Auth: 3fsiynHPTFTwdYk1t_IFer2uE0E
Message-ID: <CAP9ODKqXFqcGmM+KivgYO=nBhEGTrjpYgOeaHnJ3vKd62MMgHQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build fail in kconfig-frontends
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
X-List-Received-Date: Thu, 17 Jan 2013 10:31:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 17, 2013 at 12:57 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
>
> On Sun, Dec 16, 2012 at 1:57 PM, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> On Sun, Dec 16, 2012 at 4:52 PM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> > On Sun, Dec 16, 2012 at 04:16:40PM -0200, Otavio Salvador wrote:
>> >> Hello,
>> >>
>> >> Today I did a sync and kconfig-frontends fails to build. I submitted a
>> >> bug report (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3610).
>> >>
>> >> I am sending it here as well so people can confirm if it is
>> >> reproducable in some other environment?
>> >
>> > It failed exactly the same here, but only once (on Friday) after
>> > cleansstate
>> > it built OK.
>>
>> Confusing ... it works here as well after cleansstate.
>
>
> kicking this old thread. I'm now hitting exactly this issue on my up to date
> master.
> Except for some reason I'm not able to work around it at all, and all my
> builds
> are failing. I'm avoiding purging sstate completely, but that seems to be
> where
> I'm heading.

I didn't see this issue anymore but we have been seen some wierd
failures in avahi for example which are hard to explain ... I hope you
can fix it without purging sstate :-)

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


