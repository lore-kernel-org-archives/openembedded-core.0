Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 70080786B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 16:42:56 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id w12-v6so1334858plp.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 09:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=738ntHeg0Nkciiq0Vi98TyGFLL/FvDCcGvNd6mljHDI=;
	b=fla/TkA9pJ0I5F1QH++UA+dpzOHzVcxCGQ6qlQRVCZERHIRyrLdrh6Dr1RNO2AEA4k
	953rEhthsJF7qyNrTlLA+uD7Y9XnLKKyWjQh470FebJ/JNAUlsgf7JV2IW1JJ2UpCEUk
	BYQrUaXqUhFprFkVjUekP7xjLjU8XdTR2WJf+gmdHC1gthdNkohLvnIh19XG9ELxSSAh
	62dYCkQ+BRMTDi2009fUNdn+/lauQxUPU6Nfqahx+tpUCRc6D2hfnFW8Ki6hS8ABYFMr
	9ZJkq3D+7/Imn3nk3CBs5i62S/sQZJ3K879YbMOtsKVk7kQHznpSYUos6sMY0iD1nAIg
	1SWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=738ntHeg0Nkciiq0Vi98TyGFLL/FvDCcGvNd6mljHDI=;
	b=ttCtVyqaZGr+eQohjcpP8kVO31lK9N1e72uHWLEK3eaJX7zlPp8sfuSLo1oH+W44Hd
	juY5JW4U5QDUHn3PBonUXZdW2EDD8KQrQQS62ev8o41bUYzQCUpHqyWaKEUkFmpMkX7r
	nvzqEKPMCtPaQ4aCowNsxm+WpauybAqB0QC1nwjGbrxgJXVNMApUV4nGGXP2lGN6riWI
	jH2veC0qhwDQ+VhVVTkcZuvSrNqk1WuiEE9HZIF0DBy4klxEybpGdyo7j23OBX9Fo0T8
	5Xjry/GecYC+PFNjnravQdS69rZOly2NB8dz4VV1a1826gEofej7arB9rRMsxICCq1dF
	I4kw==
X-Gm-Message-State: AElRT7HLU0daDeBel86LYKOhiOM4ixFBoJjq74EzsQxr8r7cLPv+2yRc
	fPndoCH7lBFlf11B4agn4NyYHlKgRgsfct/FtGw=
X-Google-Smtp-Source: AG47ELtaFReeufWamRjF9o0CG+WkXwY/l9keF+6DBIEdQjO2C/FUoJwvh7z/6RaOrHUapIb+SdCjSt1jRhLiZ2VH+4E=
X-Received: by 2002:a17:902:63:: with SMTP id
	90-v6mr17602192pla.125.1521564178257; 
	Tue, 20 Mar 2018 09:42:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.241.68 with HTTP; Tue, 20 Mar 2018 09:42:27 -0700 (PDT)
In-Reply-To: <CAPGMVzHSpbw+h_dbc=-9Cdm0_Q3o4EnOEcjH6fxZ3kpv6wwGNg@mail.gmail.com>
References: <CAPGMVzHSpbw+h_dbc=-9Cdm0_Q3o4EnOEcjH6fxZ3kpv6wwGNg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Mar 2018 09:42:27 -0700
Message-ID: <CAMKF1spNrTtZr4erB-7m-J+R3mzzJoR0t1T66qz-fLbLr54QdQ@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Packages build via recipe
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
X-List-Received-Date: Tue, 20 Mar 2018 16:42:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 20, 2018 at 5:05 AM, Rajath C S <rajathcs.1996@gmail.com> wrote:
> I have been trying to build keras and tensor flow packages on yocto's image
> that is poky but not able to do so since there are no recipes for them.
>
>
> What's the way to add keras and tensor flow packages to poky?
>

you can look into layers.openembedded.org and see if they are there.
if not try to find it on web. otherwise write one

