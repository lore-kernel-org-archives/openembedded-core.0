Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id D0DEC6B84D
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 12:10:43 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id ta17so423819obb.4
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 05:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=DXahegHUZ6XBfrld3Meb3vWhtnUyMssfopnW34EZMYs=;
	b=CrPldgbuSiMyONmKkHp7aKF+TcyxqFNDuhce6tAxqFxsZkmSJrwVVPiqzE8ehGMfrX
	W9VrRe3PkbW2zQt7KZweX7FcMcWOErJqc/UVnfvEPLi9CZd1My4xaRxVwQ1Y/uoWBLVu
	eCBctCG4pwVa51gDtm/j3gK0I5A7bW8PxjK7eMX0kKc3agN2J6ufh/XGT7MlGtQG0yu6
	m1cAt0Wk7pMQG06MwOq8ZIhxIycGrrIwCimYcmgI4lkgH0jqemsLwi31RPuna6IUgnbg
	pUQ791MiVo0/IgYsYoassbYF+N20kPVBegIshr9g0oHMmYMigdPbbQqst5BGzlZ+H/Eq
	ni4Q==
MIME-Version: 1.0
X-Received: by 10.60.115.164 with SMTP id jp4mr1186137oeb.19.1377000644312;
	Tue, 20 Aug 2013 05:10:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 20 Aug 2013 05:10:44 -0700 (PDT)
In-Reply-To: <CAJTo0LYzGTseb33djRVrpXmNXZB_OdHrdhfwd9D+4ovjrPQ48w@mail.gmail.com>
References: <cover.1376939912.git.nitin.a.kamble@intel.com>
	<b8e848c82d5c361278328b0569509f6cc4f58d36.1376939912.git.nitin.a.kamble@intel.com>
	<CAJTo0LayXbOWSnT=F5=ud2Vy__b0ipc9Xx6ujKkups2zWSLM7A@mail.gmail.com>
	<CAP9ODKpxNe3zw4_HgYJZksDvr4tr-Jq9FxBc28kqqpjbzP=C0w@mail.gmail.com>
	<CAJTo0LYzGTseb33djRVrpXmNXZB_OdHrdhfwd9D+4ovjrPQ48w@mail.gmail.com>
Date: Tue, 20 Aug 2013 09:10:44 -0300
X-Google-Sender-Auth: oGKE4vKKkHpjRx7cPQTTAT2E-n8
Message-ID: <CAP9ODKrxh2_ASDGpSxBiiw1O-xNpGhgUXORR0AzvAi+21+=XAw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sanity.bbclass: a new check for required distro features
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
X-List-Received-Date: Tue, 20 Aug 2013 12:10:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 20, 2013 at 9:01 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 20 August 2013 12:58, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>> Are there any situations where these distro feature dependencies can't
>>> be expressed more precisely in a package recipe, and then something
>>> like Otavio's approach of throwing a SkipPackage used?
>>
>> I have several cases in meta-fsl-demos. Vivante GPU driver provides
>> different libraries depending on the backend to use (DirectFB, FB,
>> Wayland and X11) and they cannot be used at same time. So depending on
>> distro features setting some images are buildable or not.
>
> And does distro_features_check.bbclass work for those?

Yes; I did it to accomplish our needs. So it does.

>> In fact I see same case in OE-Core; core-image-weston /depends/ on
>> wayland distro feature and this is not explicit in metadata nowadays.
>
> Yes, and it should definitely be checked for.

Agreed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

