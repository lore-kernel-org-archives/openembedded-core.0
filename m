Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 53CC06D6F5;
	Fri, 15 Mar 2019 19:43:13 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id h34so7128505pgh.11;
	Fri, 15 Mar 2019 12:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=tVqs/wA7MOdGXizJLEL3MYK9mCatAOmrilxRmzDFzoc=;
	b=fz09x/RSI9NLbgyBXiZNGZZuYyvBxF/YJY/ak0jMN6RE9GUNyhC+NLn4sEnYLBUAGK
	7GCaqzK0N3p8bS1h5D26/I4lUdGx0r4Vtj+pt9OakcexlcpI6y9ddZ/ozdheq6wD4ycJ
	SCMn+N6AzpDJnCBo8fYrwQ/mrpAJgc/GRCgUwnaLFs4Qmm/Qq+onwU8n5PIpmF4LMaFc
	KKRf6wwG2TaSiTFbhtQkpw5eWOvPy10LRdCCshmkcHLS4VSeZqYlD+7uny7hGaTtgcIW
	G0hw5emt7iKHKrH9RdkZ2haoMNoeml2WSbxEr5iZP/PFV+osSEhw94AMfbfFcLOnwAzw
	rryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=tVqs/wA7MOdGXizJLEL3MYK9mCatAOmrilxRmzDFzoc=;
	b=KxnyqktxSYVVYAaH8BWsJZ6nN6I/qF/+o+qf1qyPNKjd+l+PlXR0XobdUXcPDlLg/P
	usqKyXR2S+x8GMlPq04nKWVGVJBpkuEOH3jTXPq1m9mq/7om8XQJz4qLs038Ah1HZOTV
	SrIBnSNx4kLNAC6KPFoNi67RVn0Pg/XNT7bjZmQmVUiemIfRauQeqUgK5CyV2r5IoNYf
	YxLyVk0d7T0CwQT1Q4M2cfvVX8DQmDJFPAeaN7NphSMTZZ4ECC5wzFiU8dxMS8v0rVBZ
	ZCFSvXa/SYr7B+TZWtLGUMxxFxot3s8T7UsWCG03VcOrxcfAWKLWlyOQSEcNqdt6PjZT
	h0SA==
X-Gm-Message-State: APjAAAVv/Q6/AHNA+OY1JlMOP0li5xg62NW6F34lgBObWudiLEctsdsH
	quGkfjyKwieLe2qQgcK4Yg8pga0W
X-Google-Smtp-Source: APXvYqzw6AHETvr/U6ajFnUEtoo6g3L9AzXzvLWCc9UE0gHbJaFtEi+1z0TK6xDQp1LW8cJ+T8x/5A==
X-Received: by 2002:a62:5c3:: with SMTP id 186mr5692201pff.35.1552678993972;
	Fri, 15 Mar 2019 12:43:13 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:1c38:8eb8:1763:902b?
	([2601:202:4180:c33:1c38:8eb8:1763:902b])
	by smtp.gmail.com with ESMTPSA id t8sm3269516pgp.5.2019.03.15.12.43.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 12:43:13 -0700 (PDT)
To: Trevor Woerner <twoerner@gmail.com>, yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
References: <20190315142753.GA10387@linux-uys3>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	mQINBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABtCFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT6JAj0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxC5Ag0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAGJAiUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <2ab6ee9b-1079-528e-3646-82e08c32337b@gmail.com>
Date: Fri, 15 Mar 2019 12:43:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190315142753.GA10387@linux-uys3>
Subject: Re: OE Summit report from SCaLE17x
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
X-List-Received-Date: Fri, 15 Mar 2019 19:43:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Trevor,

Thank you for leading this effort. Its much appreciated.


On 3/15/19 7:27 AM, Trevor Woerner wrote:
> Hi,
>
> Earlier this week I got back from SCaLE17x during which I taught an E-ALE
> class on Buildroot, was a TA for the other E-ALE classes, organized and ran
> the first ever (hopefully of more to come) OE Summit, and gave a general intro
> talk on OE. I wasn't planning on giving an OE talk at SCaLE, but the person
> who was supposed to talk wasn't able to make it. I had travelled to SCaLE with
> a backup talk prepared as a "plan B", and it was good that I did.
>
> I'm quite happy with how the inaugural OpenEmbedded Summit went. Everything
> went off without a hitch, and there was a lot of interaction and feedback
> between the speakers and the audience.
>
> We had 4 speakers:
>
> 	myself (Togan Labs): Using OE
> 	Drew Moseley (mender.io): Mechanisms for Enabling and Configuring WiFi in OE
> 	Alistair Francis (Western Digital): RISC-V and OE
> 	Jon Mason (ARM): Kernel Development Workflows Using OE
Thank you all for participating in the first ever OE Summit.

Kind regards,
Armin
>
> Counting attendance is a bit tricky because people sometimes wander in and
> out. Do we count someone who wanders in partway through but leaves before the
> end? My talk was the least attended. I forgot to count the audience members
> (since I was giving the talk), but I did notice that a couple people wandered
> in during the talk. Behan counted 12; like I said, I didn't think to get a
> specific number myself. In any case, my talk wasn't in the programme, since I
> was filling in for someone who didn't make it to the conference. Drew's and
> Jon's talks had roughly 20 audience members each, and Alistair's talk was
> about 30.
>
> It's too bad the OE Summit was pitted against SCaLE's "Embedded Track". I
> think we ended up "competing" for audience members between the two of us. The
> OE Summit was put in a rather large room. Between teaching and helping out
> with E-ALE and running the OE Summit, I didn't attend a single talk at the
> conference nor spend time in any other part of the conference except for
> these two rooms (which were beside each other). I have been told anecdotally,
> however, that the attendance numbers we saw for the OE Summit were in-line
> with the numbers of attendees for several of the other talks, but I can't
> comment personally.
>
> As we were still setting up for my OE talk, the very first talk of the OE
> Summit, one of the audience members put up his hand and asked what the
> difference is between "Yocto" and "OE". We weren't specifically prepared to
> comment off-the-cuff about the relationship between the two projects; it's not
> as if we had a prepared statement to read on the topic. We tried to fumble
> through a satisfactory answer while remaining as neutral as possible on the
> topic. But it sure would be great if the two projects could get together and
> put out an official statement on the matter to which we could point all such
> curious people. Interestingly enough, this person was sure that The Yocto
> Project pre-dated OE, which we had to correct. Then he assumed these were
> two projects that had simply forked from each other at some point in the
> past. It was probably actually more confusing to him that OE and YP are
> two separate projects, but with almost all the same developers, working on
> almost all the same code. In any case, The Yocto Project's Community Manager
> was on-hand, thankfully, and I don't think he had any objections to any of
> the things we said in answering this question.
>
> My talk was a general introduction talk about OE, but all the other talks
> assumed the audience knew something about OE. This turned out to not be the
> case. Pretty much all the speakers had to field questions along the lines of
> "so what is OE anyway?". Sadly, in many cases, saying "it's like Buildroot" is
> often what would help the person asking the question the most. I think it's
> noteworthy that more people seem to know what Buildroot is, but not OE/YP.
> Although I realize this is just one conference, and a very small sample set,
> so it wouldn't be fair to generalize from these numbers. But it is true that
> these are the sorts of questions we were frequently asked, so it's noteworthy
> in that respect.
>
> Oddly enough, when I was finished the slides portion of the Buildroot class,
> the very first statement a student made was to complain about how terribly
> difficult Yocto is to learn and use. Why this came up in a class about
> Buildroot is confusing to me too, maybe he looked me up online and found my
> affiliation with OE? I don't know. I was careful to not mention the words "OE"
> or "Yocto" at all in my Buildroot talk. In any case, in his opinion, using
> Yocto requires a masters degree. Obviously he's exaggerating for effect.
>
> I'd like to personally thank the speakers who agreed to give a talk at a
> conference that didn't exist prior to last weekend, who worked hard on their
> talks, and who put together some very interesting presentations. I think we
> all walked away having learned a bit more about OE. I'd like to thank Behan
> and Tom King who helped organize. Behan who setup his recording equipment to
> record the talks (just in case there's an issue with SCaLE's recordings).
> SCaLE who hosted the mini-conference and helped with advertising (i.e. putting
> up a page and re-tweeting). I'd like to thank the OE Board of Directors who
> gave me permission to create and run a mini-conference on their behalf.
> Finally, but not lastly, I'd like to thank everyone who attended!
>
> Thank you, and best regards,
>     Trevor


