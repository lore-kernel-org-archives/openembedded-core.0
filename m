Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S1zVH-0007ts-2G
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 13:16:31 +0100
Received: by daln34 with SMTP id n34so4256087dal.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 04:08:03 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.adami@gmail.com designates
	10.68.213.232 as permitted sender) client-ip=10.68.213.232; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrea.adami@gmail.com
	designates 10.68.213.232 as permitted sender)
	smtp.mail=andrea.adami@gmail.com;
	dkim=pass header.i=andrea.adami@gmail.com
Received: from mr.google.com ([10.68.213.232])
	by 10.68.213.232 with SMTP id nv8mr38799701pbc.155.1330344483589
	(num_hops = 1); Mon, 27 Feb 2012 04:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=TrhG3jr68ZTXYzpzZ+Cp36xVeDQwj00ZrysAYoDltJ4=;
	b=WtNN+FIAdu/Bs5KslSPxoMlXT4PyQp325vjbdD1wzgeqIiNPD9vIOYQiClpfe0R5lo
	Ob3f8w3HYix7oNtwvWIGc0YrV1+XHeD0Rtx3pVlnT71kRC9ahgpRYjPJgeuvSPqgYJhU
	OJTJdYXSroMfevc1fqEWcWWi2FDqPaWYICulA=
MIME-Version: 1.0
Received: by 10.68.213.232 with SMTP id nv8mr33066807pbc.155.1330344483483;
	Mon, 27 Feb 2012 04:08:03 -0800 (PST)
Received: by 10.143.67.8 with HTTP; Mon, 27 Feb 2012 04:08:03 -0800 (PST)
In-Reply-To: <1330340722.1086.122.camel@localhost.localdomain>
References: <17057774.C0TjevbrGC@kgy> <1330181716.13788.33.camel@ted>
	<41586593.1CLnZEXO8J@linux-oxe9>
	<4F4B5DDA.6010206@communistcode.co.uk>
	<1330340722.1086.122.camel@localhost.localdomain>
Date: Mon, 27 Feb 2012 13:08:03 +0100
Message-ID: <CAAQYJAt_mvurkZ4izcEL9q5WF3Y7pSZS4Eb89=TQwDXZtiY9uw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: empty dirs in glib-2.0
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
X-List-Received-Date: Mon, 27 Feb 2012 12:16:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2012 at 12:05 PM, Ni Qingliang
<niqingliang@insigma.com.cn> wrote:
> Same problem!!!
>
> On Mon, 2012-02-27 at 18:41 +0800, Jack Mitchell wrote:
>> On 27/02/12 10:30, Gyorgy Kovesdi wrote:
>> >> rmdir was used specifically so we'd know if the directory wasn't empt=
y.
>> >> What files are in there?
>> > ...../usr/lib/gio/modules:
>> >
>> > total 32K
>> > drwxr-xr-x 2 kgy users 4.0K Feb 27 11:26 .
>> > drwxr-xr-x 3 kgy users 4.0K Feb 27 11:26 ..
>> > -rwxr-xr-x 1 kgy users 2.0K Feb 27 11:26 libgiofam.la
>> > -rwxr-xr-x 1 kgy users =A020K Feb 27 11:26 libgiofam.so
>> >
>> > It is reproducible now, even in a brand new checkout.
>> >
>> > Regards
>> > Gyorgy Kovesdi
>> >
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> I can confirm I also just ran into this issue on an Angstrom Master
>> checkout.
>>

You can fix the issue adding --disable-fam like in glib-2.0/glib.inc

-EXTRA_OECONF_virtclass-native =3D "--disable-dtrace --disable-systemtap"
+EXTRA_OECONF_virtclass-native =3D "--disable-dtrace --disable-systemtap
--disable-fam"

The issue has been ackowledged, more tests are going on.
Fix will follow soon.

Regards

Andrea

>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Yi Qingliang
> niqingliang@insigma.com.cn
> https://niqingliang2003.wordpress.com
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


