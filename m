Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id BAFA86EFE2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 14:43:40 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id x13so23512458qcv.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 06:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=LSBKCHQ+V7Nz/trPXIpiwy/+cx4hm0QjZ9DzqTOYCUM=;
	b=CVHfRJ0NIcGWwWog0Xi93WQgSHGl0kAOfZw2okeqjgxHyYiQfpiz7+ADqUPKWXm+mh
	JFsJfxJcAqcDrA4Th95sRW8i9Oh51KJ1fdEEHDOvWEdMOIooQl2ZyZ6qwe1TVqQtiMDZ
	jWwjp/Voe1QyIunpFhafXIjkKW6anUjsH1hXnl7zyvy/InpgKCa7aVa00FbrDJ5YDnwd
	D43qSKmQd63PbR65pL9NsR5GJe5x600F/r0oH8m1hNGRIFgHejZWPB3KIiiJYd/w13qr
	eyIgyzUUr55jhq6r3mop1R0AjQzF2CmcdiuyOy3kOvQoAtrAFAZjAthML9L/ukI20gBY
	9qnA==
MIME-Version: 1.0
X-Received: by 10.140.30.230 with SMTP id d93mr33282478qgd.51.1392648214975;
	Mon, 17 Feb 2014 06:43:34 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.140.100.140 with HTTP; Mon, 17 Feb 2014 06:43:34 -0800 (PST)
In-Reply-To: <CANFVK79owKYhh5z4+5FMcScZdMUxcff7eiHanFHvD0oXraP4=A@mail.gmail.com>
References: <1392586858-12205-1-git-send-email-joaohf@gmail.com>
	<CAP9ODKpexMC2MG9d4L56Hn3LJSS-dqdgBw4GDB1y56u-R8AEGg@mail.gmail.com>
	<CANFVK79owKYhh5z4+5FMcScZdMUxcff7eiHanFHvD0oXraP4=A@mail.gmail.com>
Date: Mon, 17 Feb 2014 11:43:34 -0300
X-Google-Sender-Auth: oPFphVjYVaGbaS1gHFfodxTNh6Y
Message-ID: <CAP9ODKpAk43yBz1suHgK55qxT7f+ZPRgu5K4yV0fNfjd0u8P+w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Jo=E3o_Henrique_Freitas?= <joaohf@gmail.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/2] Add task to create kernel config fragments
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
X-List-Received-Date: Mon, 17 Feb 2014 14:43:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Joao,

On Mon, Feb 17, 2014 at 11:22 AM, Jo=E3o Henrique Freitas
<joaohf@gmail.com> wrote:
>> I do like the patchset except that his cover letter seems outdate as
>> the task now is diffconfig.
>
> You are right.
>
>
>>
>> Maybe you could add another task too,
>> which we use quite often in meta-fsl-arm, savedefconfig. This would
>> easy people to generate strimmed versions for use.
>
>
> Yes, after this patch is accepted, I will prepare the savedefconfig task
> (cml1.bbclass).

Great; thanks.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

