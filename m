Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QxAKF-0007oe-QC
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Aug 2011 06:16:56 +0200
Received: by ewy5 with SMTP id 5so1851684ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 21:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1Ba+fGgDQ0nZkSJH4e8IrFGJCA+khIZz/Wvuwgcf9RA=;
	b=qNyThEV18ey4cFvyh0zasHD/7vTiOOG/kW6d9QfuBepFOwq4ssoDEn1J2eOg6QHzKM
	CkyUL7QqJqbL5n/dOrmWfLeSxjMjjsFSFkMZ0C8Yut/4Wjg7zgPtEd0eHYtHgPoewtrF
	hWQ0w84UsSKNOTDQVxuzUc8PBerIT1R9ifoJk=
MIME-Version: 1.0
Received: by 10.213.3.200 with SMTP id 8mr2033423ebo.38.1314418325803; Fri, 26
	Aug 2011 21:12:05 -0700 (PDT)
Received: by 10.213.106.8 with HTTP; Fri, 26 Aug 2011 21:12:05 -0700 (PDT)
In-Reply-To: <abf615e596934df48ad620207828b227@DFLE70.ent.ti.com>
References: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
	<1314318504-9524-4-git-send-email-joelagnel@ti.com>
	<abf615e596934df48ad620207828b227@DFLE70.ent.ti.com>
Date: Fri, 26 Aug 2011 23:12:05 -0500
Message-ID: <CAD=GYpZ3sMnyrWj0EztVN-MK0tpRYaLF4R1UHPz12bO7b=dOQA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH meta-oe 3/9] libmad: Imported from OE-classic
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
X-List-Received-Date: Sat, 27 Aug 2011 04:16:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 26, 2011 at 2:59 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 26 aug. 2011, om 02:28 heeft Joel A Fernandes het volgende geschreven:
>>
>> diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
>> new file mode 100644
>> index 0000000..537d685
>> --- /dev/null
>> +++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
>> @@ -0,0 +1,34 @@
>> +DESCRIPTION = "MPEG Audio Decoder Library"
>> +SECTION = "libs"
>> +PRIORITY = "optional"
>
> That field isn't used anymore
>
>> +DEPENDS = "libid3tag"
>> +LICENSE = "GPL"
>
> Which version?

Hi Koen,

Isn't it implied that its GPL v1? I've seen several recipes in OE-core
that did that.

Thanks,
Joel


