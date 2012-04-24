Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SMoY3-0004jf-2H
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 00:49:27 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 24 Apr 2012 15:38:45 -0700
Received: by lbbgi4 with SMTP id gi4so851836lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 15:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=SbYTcKzyXypuYcwOWN8mkD1lSBfTExBO5KH57P0h2Z8=;
	b=VS6NMp9/mq1Kp+jyau3XSouUxr9G0V7J/yUlXdOd5x/FKVMt68bmBfar65fdqQyTVa
	tgxQpmMXnKqZdaBhskbS5Qt3GcMw/1ieWbVEcquHzK9U9dOQ6EzA4ayBFTDVVgIvZaqZ
	Sp2psqBLxaR3ZJ9CKkUpIuKe3L7NM53vG2BJVauy/5Wl9bjpbIvq+RFG1LhGI49xAUCj
	4f7q5jArlw/qWpg6+IgAUYzqbGTf9plPEaD9hKlqRTYQL+NYYt/lAASVa37bMMNuOnuU
	1Gdxyc9BplmOl55ubMJr7RmMErfI+7LPNoO4OtpB58WPrhehz6Cu3z9hF2OazugNvZQM
	j2yA==
MIME-Version: 1.0
Received: by 10.152.147.100 with SMTP id tj4mr229221lab.39.1335307123240; Tue,
	24 Apr 2012 15:38:43 -0700 (PDT)
Received: by 10.112.107.137 with HTTP; Tue, 24 Apr 2012 15:38:43 -0700 (PDT)
In-Reply-To: <CAK18fxG0_-aQDuPMA5drMAA8Kk-bnAPw-THrxafAOM6amvE2hA@mail.gmail.com>
References: <CAK18fxFXyj7U1RgBSigrED+H6BjJjx3uCcWY2nVONCOULxL+iw@mail.gmail.com>
	<CAPhnLPDr2epHUeCjDaeg473mv8cR9jf6gA-BpxT=jU_BDcq3sg@mail.gmail.com>
	<CAK18fxG0_-aQDuPMA5drMAA8Kk-bnAPw-THrxafAOM6amvE2hA@mail.gmail.com>
Date: Tue, 24 Apr 2012 15:38:43 -0700
Message-ID: <CAPhnLPCWAKLiLUfKVaguN_cFA=PAgRhW4vZ-pa1XDtW=Wugvpg@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQko4tmhFKr8GgT+7YQk6oyhfGyK5DgGffzIU5lJVR9HCje19IxXMJGdqWzQEnY/WjfxiCRC
Subject: Re: LICENSE_{X}-xxx is parsed?
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
X-List-Received-Date: Tue, 24 Apr 2012 22:49:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 24, 2012 at 2:15 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> On Tue, Apr 24, 2012 at 20:44, Flanagan, Elizabeth
> <elizabeth.flanagan@intel.com> wrote:
>>
>> On Tue, Apr 24, 2012 at 10:25 AM, Andrei Gherzan <andrei@gherzan.ro>
>> wrote:
>> > Hello everybody,
>> >
>> > Is there any=A0mechanism of parsing LICENSE variables for every provid=
ed
>> > package in a bb file?
>> >
>> > To be a little more clear about this.
>> >
>> > If i have an app named myapp. Let's say the myapp_1.0.bb includes:
>> > LICENSE =3D "GPLv3 & LGPLv2.1"
>> > LICENSE_${PN} =3D LGPLv2.1
>> > LICENSE_${PN} -tests =3D GPLv3
>> >
>> > If this app is not whitelisted, this file will pe ignored (assuming
>> > INCOMPATIBLE_LICENSE =3D GPLv3) even if the only needed package on the
>> > final
>> > fs is the ${PN} package.
>> >
>>
>> As you have package level licensing set, it will actually check the
>> LICENSE_${PN}. See:
>> bdf2d94c35b7e5ed1723f987696a6c865bff212c Which means it will go and
>> use the PN level
>> license to determine if it should be excluded. If no PN level exists
>> it should fall back to LICENSE
>>
>
> I=A0realize=A0this but still, what about the rest for packages provided i=
n a bb
> file?

The rest of the packages in the bb should be inheriting LICENSE if no
PN level license is set. Which obviously causes problems for the above
example.

In a case like above you'd want to do either of the following:

a. Call out each package's license individually (better but can be
painful for recipes with lots of packages)
b. Leave GPLv3 out of LICENSE (easier but not technically accurate) so
undefined package level licensing inherits the correct LICENSE.

I'd personally do the first choice as it's cleaner.

-b

>
>>
>> > For files in these case (like gnults) we use right now WHITELIST. In
>> > this
>> > way license=A0checking=A0on those packages is skipped.
>> >
>> > If nobody works on this (or this is already done but i couldn't spot i=
t
>> > in
>> > the code) i can dig and propose a way to solve this issue.
>> >
>> > @g
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
>>
>>
>>
>> --
>> Elizabeth Flanagan
>> Yocto Project
>> Build and Release
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


