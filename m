Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id D7C4B753B6;
	Fri,  6 Apr 2018 20:46:26 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h69so1567884pfe.13;
	Fri, 06 Apr 2018 13:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=F9j7wHUABuNldvccQuwiWB2f6o1Qp96vMirHPk0AtzA=;
	b=sBU8PoGJDR+srmw0T8rMLQiDQUp0ctczJtrPOkBvV02BGoWEcxHnA0+ToMPCQd888P
	kykUKAx/h3OUNMu7pkwfjgeS6JBxl0oTaj8iIii/qjgs36ttg032NhTZnHrpLEDqz1xs
	A7U88L9/eKM4Pa63njDkhJ+1MtOFDj8N2U/H1nYaOfd28F+i3q60TTi5DCGUZJ7JSNCe
	w00BaAVr668TciMelE4w0cQJu7NUnZzOrQgNlPPQ1j8heg2LR4pVmvHx9ehuWn/bCJPC
	OZSnXehKUnRv9RwGe+epuW2EIkeGUG1gRbVRcCHpdC4oo0mpFHS5tqRpZ/UtZsPFLomh
	r81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=F9j7wHUABuNldvccQuwiWB2f6o1Qp96vMirHPk0AtzA=;
	b=GGOypx5RBpNQuHiH31GaRwKSNoJuwibuKcFj8ZPpJEPjiAf2uSgK2iiEidbfOeS0dW
	TcTsnoeh8bCRQ+5+GaFGLIqdqQj4UhufNFDA88zrwAT2+CGDk5ceEpPkFRAbZKkQrAbE
	KJWFIrPfRuiiJrMDTO/q+dEGxODmJFR/ydtUhbmQxUlp4Z0uZ9c4cqQk66MyETUh3exu
	/SOq1df5Pb2u7E0MV36ghCOWyuTWpy4VJFi0NlUohYnEFSfBm4Gl70JPKedLg6nP/MJh
	GnAcJr57EuUPOtwY7SoqtqogCW7ucyRnuhUOG3mFVDdE7JCLmhR5iUfrr3Kbkfmbo8WZ
	rfuQ==
X-Gm-Message-State: AElRT7HhSJsM3MvVamR9dvn5lca1g08Z0iZJ6ENTUj3JwPprongEY1Fg
	cipj3OK1dxXjFlENlbmDf+j5Og==
X-Google-Smtp-Source: AIpwx48BL9eDogc8CbJDw+n1Y2KQIwtn9YKE4dkRIXVFSM7eTn7FXzc3SYZcCA8PKVQXT1BAupxkZw==
X-Received: by 10.99.111.140 with SMTP id k134mr18935803pgc.11.1523047587556; 
	Fri, 06 Apr 2018 13:46:27 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:b0a5:8e4b:7c5e:fa8f?
	([2601:202:4000:1184:b0a5:8e4b:7c5e:fa8f])
	by smtp.gmail.com with ESMTPSA id
	t18sm23369362pfg.103.2018.04.06.13.46.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Apr 2018 13:46:27 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Trevor Woerner <twoerner@gmail.com>
References: <1523011021.2942.6.camel@linuxfoundation.org>
	<20180406141647.GA19068@linux-uys3>
	<1523028587.2942.13.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <a04373f5-cb03-25a3-36fa-da92b0cdd71d@gmail.com>
Date: Fri, 6 Apr 2018 13:46:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1523028587.2942.13.camel@linuxfoundation.org>
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
X-List-Received-Date: Fri, 06 Apr 2018 20:46:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Shouldn't Master get all these changes first then we switch to stable
branch when we have a new release?

My German genes are raging about "Rules" ; )

- armin


On 04/06/2018 08:29 AM, Richard Purdie wrote:
> On Fri, 2018-04-06 at 10:16 -0400, Trevor Woerner wrote:
>> A) Some layers only switch to an official branch name when the find a
>> reason to. E.g. branch "sumo" is created on openembedded-core but
>> meta-A keeps working on master unless an incompatible change is
>> created in openembedded-core that forces meta-A to create a "sumo"
>> branch.
>>
>> B) Other layers create official branches the moment they exist. E.g.
>> branch "sumo" is created on openembedded-core and meta-B instantly
>> creates a "sumo" branch to mark this point in time, and continues
>> working on master. If meta-B's "sumo" branch fails to build against
>> openembedded-core's "sumo" branch because an incompatible change is
>> made to openembedded-core's sumo branch, meta-B fixes the issue on
>> the sumo branch.
>>
>>
>> I can see how the change you've implemented will be very useful for
>> the A)
>> cases. Will it be needed for the B) cases? In other words, does the
>> code
>> you're adding implicitly assume:
>>
>> 	LAYERSERIES_COMPAT_<...> = "layer"
>>
>> for any given "layer"?
> No, there is no implicit assumption.
>
> In both A) and B) cases the maintainer adds the new "codename" to the
> list of compatible layer series in LAYERSERIES_COMPAT_<layer> for their
> layer. They can list multiple layers in there, e.g. "rocko sumo".
>
> The one annoying thing about all this is the layer maintainers do have
> to update layer.conf each time a new release codename comes out. I
> think that is a reasonable compromise to be able to give users a much
> better idea of which layers are compatible or incomaptible with their
> setup though. It means someone has looked at it and believes it will
> work with a given release series.
>
> Just to be clear, "layer" would never be a valid value there, it will
> always be the release/branch codenames.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture


