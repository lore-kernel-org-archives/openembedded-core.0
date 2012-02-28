Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S2M7L-0006IQ-I5
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 13:25:19 +0100
Received: by vcbfl13 with SMTP id fl13so2041190vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 04:16:51 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.95.74 as permitted sender) client-ip=10.52.95.74; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.95.74 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.95.74])
	by 10.52.95.74 with SMTP id di10mr12589328vdb.46.1330431411745
	(num_hops = 1); Tue, 28 Feb 2012 04:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=cKQTRYHD9AAoMf3ZbG0XRYF96Qh0TXuJjLBo5kHo1Jg=;
	b=jRYoMrC0tBaUk5owBgbzAblIJcoFXV0uDbhLKeA/R1VPgDjylYh5epc5yZsceSNSs+
	qt70+yi8PTF79oumjEqMW+Zcb9WcAgWIPtCalti7S1dZXkzBwyU7aSM65VtnQz+IRC3p
	ys9sDKLr3tBSt5aklA+OgVOAGH2E33k2oc6gs=
MIME-Version: 1.0
Received: by 10.52.95.74 with SMTP id di10mr10381453vdb.46.1330431411319; Tue,
	28 Feb 2012 04:16:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Tue, 28 Feb 2012 04:16:51 -0800 (PST)
In-Reply-To: <CA+chaQdCwS+hwFrt+wcBts3B_jewa1mF_P8JpehySaCNwv-Qwg@mail.gmail.com>
References: <1330362610-12851-1-git-send-email-obi@opendreambox.org>
	<CAP9ODKr1faEWrO877gfeMkutp8_STOvNp81iA00uiC0w46A1qQ@mail.gmail.com>
	<1624619.CXJLtNuTG7@helios> <4F4C279E.8020801@opendreambox.org>
	<CAP9ODKo=z7tARxZ1yc0sFWf8nhnPn7px9WwyGOJHksC7shqTnw@mail.gmail.com>
	<CA+chaQdCwS+hwFrt+wcBts3B_jewa1mF_P8JpehySaCNwv-Qwg@mail.gmail.com>
Date: Tue, 28 Feb 2012 09:16:51 -0300
X-Google-Sender-Auth: RSubCy8meyUGNqf6Ve4ci7iptjY
Message-ID: <CAP9ODKo5gwuL+mvhUPiCSYm3pa89gvwR-LvRuOs0Eq0-ZnMqmQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] qt4.inc: depend on tiff
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
X-List-Received-Date: Tue, 28 Feb 2012 12:25:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2012 at 03:50, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Not really; let's say if you had done a typo on the depends list it
>> would be unnoticed in autobuilders and commited onto master.
>
> I see your point, but OEBasicHash will notice new dependency and then
> it will be rebuild
> at least by poky autobuilders (if they are building qt4).

We're not using auto PR yet so let's keep the regular flow for now.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


