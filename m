Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 291F873259;
	Thu, 26 May 2016 20:18:33 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id c189so117215605vkb.1;
	Thu, 26 May 2016 13:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=Th5Um2z4X/5gh5POs0V9Cr2fQ1lJXEZJS/7pmKbpi3c=;
	b=r+w07sXCnsXj71WymPtJDirq/h4/K803p93VG3VSDngHzfpg8OpMBVGeJcuCXq0zXt
	/C/HERcvnzAyhkTgO5Df0jwFNkYomfcvqVvnR3yiJ43YgZqq6nbu0loNtOuuLGrneCwP
	CwENUiLWj9xYmfa7lCP6vrPf/yO+xyRT0mspb9aNQXgA+ibsTuehT3JgEzPXZ1Yy0Yz5
	QxnmgGGeGCYxcpYPmhifF6uM3vm0QAotQhprN2XIzHwfIZk37c6nUhM3nIfsnWOqfdNO
	zcJLguOxNVZ/zoxHTCByJbOaRDKRInDv0nntyue+HS+Zy5nUHsM86V6bSa2HsPHSmn7Y
	/N2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=Th5Um2z4X/5gh5POs0V9Cr2fQ1lJXEZJS/7pmKbpi3c=;
	b=XeamCXKQarfnrPyUNvKwLMuf8ePoItGmD3a259f071nLb8JCFAIL7JjSK3UnC1h15J
	dd14cIMtuSdQQf4hOzHqkI8hYD7vWw46hT16nFk7ZfGbU8Cds3uuktBrk6B73LaxXQ4R
	QWMwryDWgwyZro03U7YE1rE16VPhG9dYuKaaZPZHPX+EW1GI+poJAulGIjvPDvNZr3WT
	IkTcHit172lE3uVmMF2DtWQ0vkt0bKKLvpI6ROz87pBWj2lykNCDnmi48bSzRQpb53bo
	9GGBBLm4A8dnmEllX4cAA7GCIi8u+l8sj2DYV1eg2aMwW7gZcNG3BTJL6E5VUEA/SsMJ
	0gNw==
X-Gm-Message-State: ALyK8tJty2LMdJX30fpCY7/fGB9rKYrFAT8BFJJmLARS8/vwP3izOZqbhk9BUhRrSuGOXoFtebiZ8/0gy6wHfg==
MIME-Version: 1.0
X-Received: by 10.176.1.225 with SMTP id 88mr6641561ual.51.1464293914466; Thu,
	26 May 2016 13:18:34 -0700 (PDT)
Received: by 10.159.39.68 with HTTP; Thu, 26 May 2016 13:18:34 -0700 (PDT)
In-Reply-To: <3785754.gtfDI8MhLU@peggleto-mobl.ger.corp.intel.com>
References: <1464054649898.9b34c448@Nodemailer>
	<20160524092336.GA27824@mbabyjoh-desk.ger.corp.intel.com>
	<CAOd_LFwLw9QMk4YdpbE2aD5k3CwiWQfcqhczdFM4=iBGhFQ98A@mail.gmail.com>
	<3785754.gtfDI8MhLU@peggleto-mobl.ger.corp.intel.com>
Date: Thu, 26 May 2016 22:18:34 +0200
Message-ID: <CALbNGRTBcwNx0SMYjQ2GbRJviekG8h734t0yH24zeyiQEG367Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Cliff Brake <cbrake@bec-systems.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] OE Changelog since 2016-05-15 until 2016-05-22
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
X-List-Received-Date: Thu, 26 May 2016 20:18:36 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 26, 2016 at 10:14 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thu, 26 May 2016 13:46:21 Cliff Brake wrote:
>> On Tue, May 24, 2016 at 5:23 AM, Maxin B. John <maxin.john@intel.com> wrote:
>> > meta-java repo was moved to:
>> > git://git.yoctoproject.org/meta-java
>> >
>> > Is it possible to update the list with that info?
>>
>> Done, thanks!
>>
>> https://github.com/cbrake/openembedded-admin/commit/51604da79ed5a02341562a9b
>> f254b3dd9dc71704
>
> At some point it would be great if this script could be driven from the OE
> layer index rather than being a separate entity - then updates would largely
> be self-service for the maintainers, or at least they would only need to be
> done in one place.
>
> Cheers,
> Paul
Maybe a bit off-topic but layer index should have some mechanism of
removing rotten layers.

Andreas

