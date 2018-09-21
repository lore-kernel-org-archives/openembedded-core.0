Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id D8FBA798CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 15:33:03 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id b15-v6so11734053oib.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 08:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=k06iUaj1MiXgJDSjdJD8CU5ruykFh/up5xlIKtnLM6g=;
	b=qi3kmVs07ad2pDX/KMQVFqyEkeLsGpKXaj08pttGxED3jMbVOxcAOleg4xvbRNR+vt
	5DBgKghC9EwIABz2wBlSTlEp8ZMIMAz6tXzJzkjVdCWl7g3su6/DDujFa7gJRXw7vFEP
	Tzi7eqzrG2zsimwcheXm0FhQoCx53YPEZaHh05uEOB3r60HlyCeHPeMyokiFK/Yx3AnH
	2FSytPYL6ojrbq8YLspT3RcV8ybwVQO4pkJDqb/RrvcymiZdGpaM1cU1EE8rBdJqOgKh
	GZM0h1xCvRVshvgHsnB9/vokZhWmYVuSCDNluViSbugQwi0ni8bA9Ml6dk6YI8oJSqSa
	0WNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=k06iUaj1MiXgJDSjdJD8CU5ruykFh/up5xlIKtnLM6g=;
	b=MO2wNnFxBeO0zIQkfQLwGYRNINfcn7G9PyqpNYdXYyNZmIdPFISnC5vr4ABPlq9Bxm
	GwR6m9wV4DR5enXvIWNhiAaHUil6c8GmlEl0uVoRq79ia2DEebE3OAWMuT9j1YMhVgzA
	YzXnvGnULKwsaCSMtZ42zv0chbOs7d7r0/qgxSGhZOqI5XMpNdVbbOdRMNZ4Rxmoq4I6
	qGsLdKjPDLXFqEVnf+6mr1Ox9I21Q0C9XZKPbnTa3lAOIib+3+iyqtSWWSEPPVk5bzQR
	oNcEGC5JGGTlft10mhInpJ5cCEi+8vtCy+6PiwfAlczdmfuZAaB1o4dIfTG5XCIVMRzN
	P5Eg==
X-Gm-Message-State: APzg51DVhCVDntuezjNXsqDYA1HRvgeOnfaKdGtzMv/xjiP0dErDEq8x
	DkQfjwHSj97wCjXpzR/7UphUqz18ZJhka9FK3dI=
X-Google-Smtp-Source: ANB0Vda8w89N2rLIq+PDBkcNIPN6jWHhUsfbyAWWViVCF28v59U2EFdt7O4dCfFDqllCkZwpVJ8p6RoKORnB2IeSNgg=
X-Received: by 2002:aca:5397:: with SMTP id
	h145-v6mr2040146oib.188.1537543984716; 
	Fri, 21 Sep 2018 08:33:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:490c:0:0:0:0:0 with HTTP; Fri, 21 Sep 2018 08:33:03
	-0700 (PDT)
In-Reply-To: <CALbNGRQtXBw+yAeUK5X5WDZtrv6WeuSH1ZQ97neVrkJm4v8wVQ@mail.gmail.com>
References: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
	<20180402215705.GA25121@linux-uys3>
	<CALbNGRThT8S5bfJH=zXMkQzCMMasQ=yUoEXTjsfPXtncig3yFA@mail.gmail.com>
	<ada194d6-5653-fde7-a70a-64646b08b281@intel.com>
	<CALbNGRTthOp+_T-6c_Vc3qmgMHTt-2ztyDiGbNEHY4+6UuW2ig@mail.gmail.com>
	<CALbNGRQT94ptEPAygj+Rm9vBm27yo=inbz+O6nR2gL_etkGd7g@mail.gmail.com>
	<CALbNGRQxauR4PkJ+FMXKmnJapcWO9pVSvW1cLVyrDU9-T+o65A@mail.gmail.com>
	<0717be0e-0c72-e3f5-dc11-8e4065585749@intel.com>
	<CALbNGRQtXBw+yAeUK5X5WDZtrv6WeuSH1ZQ97neVrkJm4v8wVQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 21 Sep 2018 17:33:03 +0200
Message-ID: <CALbNGRRVkb19JTLwAPJhUeKSf1guBKU9O_x2VemBr8-uKSw_AQ@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>, 
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: bruce.ashfield@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel menuconfig broken?
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
X-List-Received-Date: Fri, 21 Sep 2018 15:33:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 21, 2018 at 4:39 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> On Fri, Sep 21, 2018 at 1:46 PM, Anuj Mittal <anuj.mittal@intel.com> wrot=
e:
>>> Hi,
>>>
>>> seems upstream has introduced changes 4.17 -> 4.18 - the patch does
>>> not apply anymore. Is this patch available for 4.18 somewhere?
>>>
>>
>> Are you looking for this:
>>
>> https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit?h=3Dv4.18/=
standard/base&id=3Dbd6314212686ef8156a108b6f1eec67d34402878
>>
>> https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit/?h=3Dv4.18=
/standard/base&id=3D0aa800372a846d6ed2c0fc3e0fdc22656d268968
> Exactly thanks
>
Otavio pointed to it when I sent them to linux-fslc: Why the code duplicati=
on?

Andreas

