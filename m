Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id DC1E9750FB;
	Fri,  6 Apr 2018 14:16:50 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id e98-v6so1919869itd.4;
	Fri, 06 Apr 2018 07:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=soVOaLJsc/eqgu5TkccVASIT/YzNJ32Gg1kiqjcqrek=;
	b=oWJygKyunH0jpod5jDBFybeEyHIg/FF0CmF8KOrJwXyC5gjDFqjLD2Dd4EivN7JO8+
	Cs4Sov5bU9dBP2git2mB4EjIziXVfH3+rK/3O0YLnIeTNz0jTnBB4AyBiS5IwsV1VYvp
	PXi1tv6OKvL/yx02ZChqyr+rhzmFZhtHedMoNpXs7AIZtilLPh77m1XHQPlzcj6Bxqmb
	pF6LGYWzku6CyWBCJ02wb6EA6Udw6fMJhWk5Y0EY/1+/SmhFyF79Agpvny3wuU71n8r2
	aytR8X4Vui6G5KKAB19xnPtj+9H8+ZviEdqdh0MvBJdrScOG55eDSJ0vt9GD1gNMKGp2
	3ITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=soVOaLJsc/eqgu5TkccVASIT/YzNJ32Gg1kiqjcqrek=;
	b=F01PCqvA577Dh+XmCMFLssRqPUlr72dSAxwhW0KY9pMvMJYL86+/sg5cRFA0m34nrP
	LShpVJERQidHB+iOkwBN31D4mp7Ydd9zQxcxlTAfhsIXa9Ayn86R7tGhwyldWpEGIjYf
	38c1Mxt6Ekfv87f624h5i7bOSwsLmUwwUjJuVJvY6E4QYGTX8zvmk/S65rK0/FKLaBn1
	G7ATBVgOIhJ+3Q80UXxRuVtAqsHo5xeFOxW+emsdIw1+1bBmM5RSHFFbgb4UG+dOfTic
	J3TQX1Gibj70zpfPy+APLretFQFJPP3Lo27rr1wKqlhbwvovJIsCfN0vtNhTtUT94mai
	87ow==
X-Gm-Message-State: ALQs6tBgpSpDgU0c8nTLMsz51lUscgMi0uucETcwhZFo0Y7BslbIz1bn
	JGPHfsMUFCQWtv65sWAiHks=
X-Google-Smtp-Source: AIpwx484EnwKioLEa/9r6+aGy/fmAVFcTZHK24ooavUtm2qThfBhD02Ni0D098p0H1GOsFtKD8S8ug==
X-Received: by 2002:a24:564e:: with SMTP id
	o75-v6mr2310472itb.64.1523024211390; 
	Fri, 06 Apr 2018 07:16:51 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	b72-v6sm6050801iti.17.2018.04.06.07.16.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Apr 2018 07:16:50 -0700 (PDT)
Date: Fri, 6 Apr 2018 10:16:47 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180406141647.GA19068@linux-uys3>
References: <1523011021.2942.6.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1523011021.2942.6.camel@linuxfoundation.org>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Alexander Kanavin <alexander.kanavin@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] LAYERSERIES
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
X-List-Received-Date: Fri, 06 Apr 2018 14:16:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

A) Some layers only switch to an official branch name when the find a reason
to. E.g. branch "sumo" is created on openembedded-core but meta-A
keeps working on master unless an incompatible change is created in
openembedded-core that forces meta-A to create a "sumo" branch.

B) Other layers create official branches the moment they exist. E.g. branch
"sumo" is created on openembedded-core and meta-B instantly creates a "sumo"
branch to mark this point in time, and continues working on master. If
meta-B's "sumo" branch fails to build against openembedded-core's "sumo"
branch because an incompatible change is made to openembedded-core's sumo
branch, meta-B fixes the issue on the sumo branch.


I can see how the change you've implemented will be very useful for the A)
cases. Will it be needed for the B) cases? In other words, does the code
you're adding implicitly assume:

	LAYERSERIES_COMPAT_<...> = "layer"

for any given "layer"?

