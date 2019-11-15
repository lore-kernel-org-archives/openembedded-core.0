Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 823247F817
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2019 00:17:29 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 8so8445252wmo.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 16:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=PRwe3uWbVwP5KvzXxcacHXCbn+K7nwmXxsOspjYktP8=;
	b=ODQvTAb88CF7gedJpcD3nXInOYb8+GUhCQdeFwwIPDiqrLmQfN3sGxIr5jElrx4BbJ
	inEk6t7yUNtkKf00is2I8S26tn7zplmKndY9QzCIwiuEARZTBz9RCIRIWb4H5GiW1PG5
	ZKp8i/KCxyvU/k5Vm5BtNyv0Poct1MPIp2Phs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=PRwe3uWbVwP5KvzXxcacHXCbn+K7nwmXxsOspjYktP8=;
	b=R85vY+XIaSkuR+iSSqlwPoKRnUlqfdVu0vjoEH8uRWJRRamuIw7Dm3xVgGsEVeVRIz
	y3AIvElF6QzlfcUFV9gBwr5yiw6uaFIB4emsXj8H/mC9W9ReEy6jj8Rf3fxHLdJiDGJB
	PFec4fIHBWpFgIRjSF1/f6MIctGZznaSwj/KcNlU2OP41wuj30KY59Ca+aFi7PcoDjVi
	Hs3FdIvrE+wsvuOr43BzWhSMnPY7Lv4gykUUEGeXynKQvFWUJUzjnFU8ZZPSmK/MPQRp
	Ub9eKWYycKp3hF4B3k98M181EtkAgwU9P80SZMR/mWiCFUuaZfmP5Zgh3yCr8Rb0yMiI
	M7QA==
X-Gm-Message-State: APjAAAXX031wgxHEAuZAGNdEilXZYek0ADPB/j4/q+U8Fs41Paak8vig
	MXJ6Vf6kyhsx+7JwOXbc8DHwKw==
X-Google-Smtp-Source: APXvYqxZhN9Xu8EoITyplwnKWZOz0sm+XZTKCplng3Ztih/VqwAXDX8NN639dqSNd+j8fF4Kx2vTqQ==
X-Received: by 2002:a1c:7e82:: with SMTP id
	z124mr10446834wmc.136.1573777049986; 
	Thu, 14 Nov 2019 16:17:29 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u13sm7326830wmm.45.2019.11.14.16.17.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 16:17:29 -0800 (PST)
Message-ID: <9254454c9709af403fd9af8d964ce5227f961d69.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, sjolley.yp.pm@gmail.com, 
	yocto@yoctoproject.org, openembedded-core@lists.openembedded.org, "Erway,
	Tracey M" <tracey.m.erway@intel.com>, Ross Burton <ross.burton@intel.com>
Date: Fri, 15 Nov 2019 00:17:27 +0000
In-Reply-To: <44cd46c9-ddc1-a7fd-ce2f-3cbcf4331152@gmail.com>
References: <014c01d59970$73f28c40$5bd7a4c0$@gmail.com>
	<44cd46c9-ddc1-a7fd-ce2f-3cbcf4331152@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [yocto] Yocto Project Status WW46'19
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
X-List-Received-Date: Fri, 15 Nov 2019 00:17:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-11-14 at 16:11 -0800, akuster808 wrote:
> 
> Hello Stephen,
> 
> On 11/12/19 7:47 AM, sjolley.yp.pm@gmail.com wrote:
> > Current Dev Position: YP 3.1 M1 
> > Next Deadline: YP 3.1 M1 build Dec. 2, 2019
> >  
> > SWAT Team Rotation:
> > SWAT lead is currently: Anuj 
> > SWAT team rotation: Anuj -> Chen on Nov. 15, 2019
> > SWAT team rotation: Chen > Paul on Nov. 22, 2019
> > https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
>  
> I watch and triage stable branch builds I initiate week after week
> and I no longer want to take on the responsibilities for the other
> builds. I therefor am removing my name from the normal swat rotation
> and have updated the wiki accordingly.  This should set the
> appropriate expectations. This unfortunately puts the full burden
> back on Intel and WindRiver.  If things should change in the future,
> I will let you know.

Thanks for your work on that team, its been hugely appreciated. 

I think it may be time that we suspend the SWAT process and have the
build owners handle it themselves.

Cheers,

Richard


