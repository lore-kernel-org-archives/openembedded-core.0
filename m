Return-Path: <jefro.net@gmail.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id DC5B860043;
	Tue, 12 Apr 2016 15:24:49 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id j11so30208776lfb.1;
	Tue, 12 Apr 2016 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=7P3wK01wjViqosdbzSIPrgQmppNkWqA9CKP0hIqj5yc=;
	b=1HcPb09LFFBcBonuVX9WMg3qCpWuY/vJM5D8d+BtDANrLrZSvQobRziU3bTx2Vbb4p
	lToRbKQwYi5VgSegDIDMM5vzgpvy93Z/Om7X0W2Aaz825B+HP2SiUClSJg2wNA3Za1T9
	AQXkv2CIKqZcnmw31/k6WfA4B2Tugflxn9QHrH0bTInMEUkJBE+TXFEtC85fuQLt3VA7
	4Sou5JOHakmHb4TNYJemaMcSYfZTI1fT0Zap1Bgd1Pl379dzeulKg+XzY0nHiTT97sfb
	qIeb1Fi347/76ACcrB1ZvDYL64soJeoIcGN3QsvLwySiKAZghyFggjcMF31UrSNl8oVE
	Wtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=7P3wK01wjViqosdbzSIPrgQmppNkWqA9CKP0hIqj5yc=;
	b=WpqZA4KjkTQzvmiyMSzuZhOH5vQCvWgYSGMVCaxcwI1I48EptD4vsT8rDJ/MyJylgQ
	LLd66bCrAoNRA5BqZ2XeahfVqcJblacbnYplGgiRtT7DpQyooNjhUIrMmbGwh98mLqv4
	MmCht0wxFfBMVtYrZca8wDnaxKyhTxi5AvQ/N6B6enkcg/pP7mQPXPzwNDXnCMGIKPjM
	IEE0dLJwLjbMyHQV8aSV6ltmQOleyym3vnf+eX/YGEG81GYPZ+QYYbpIlMyOE6X666aK
	hMNOrNgZoiLf08kR1k2JvTRslD2q/1I60FWag3g0niqB446cF8Czu/up8vloBHe3GQgu
	VZ1g==
X-Gm-Message-State: AOPr4FX6Cf1JcTM0VTeN0bgvJ8ECm5Tqic5u0WJTfvykX4VdaV+sf8raaqCLVJOm0+QR0SakoQXRscHyV1Ae8A==
X-Received: by 10.25.37.135 with SMTP id l129mr1788348lfl.56.1460474688507;
	Tue, 12 Apr 2016 08:24:48 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.112.8.68 with HTTP; Tue, 12 Apr 2016 08:24:28 -0700 (PDT)
In-Reply-To: <CAHQecY4PBZ-PHi6SefradTq5o2PXKo0wbo-jid80hMc0bfkYgA@mail.gmail.com>
References: <56DEF97F.9070306@balister.org> <1458767514382.89578@seescan.com>
	<56F30D13.6030909@balister.org>
	<2408177.Nm4BLto1dd@rjs-zotac.streifs.net>
	<20160412013543.GV16135@denix.org> <570C52DB.6060901@balister.org>
	<CAHQecY4PBZ-PHi6SefradTq5o2PXKo0wbo-jid80hMc0bfkYgA@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Tue, 12 Apr 2016 08:24:28 -0700
X-Google-Sender-Auth: 55_6rAyW5V4eQnVPNa1LabfPd0U
Message-ID: <CA+YB3rbjhPsvzN_b70qzXXop61cdzqKbi9H2pKBeo5yRoHhL7Q@mail.gmail.com>
To: Tom King <ka6sox@gmail.com>
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>
Subject: Re: [oe] [yocto] OEDAM, April 8 in San Diego after ELC
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
X-List-Received-Date: Tue, 12 Apr 2016 15:24:50 -0000
Content-Type: text/plain; charset=UTF-8

Coming soon to a wiki page near you


On Mon, Apr 11, 2016 at 6:48 PM, Tom King <ka6sox@gmail.com> wrote:
> do we have meeting minutes posted someplace?
>
> thanks
>
> tom
>
> On Mon, Apr 11, 2016 at 6:43 PM, Philip Balister <philip@balister.org>
> wrote:
>>
>> On 04/11/2016 09:35 PM, Denys Dmytriyenko wrote:
>> > On Mon, Apr 11, 2016 at 03:35:21PM -0700, Rudolf J Streif wrote:
>> >> Hello Everyone:
>> >>
>> >> If you attended OEDAM last Friday in San Diego, I very much hope that
>> >> you enjoyed being here.
>> >>
>> >> The Catamaran Hotel, where we held the meeting, would very much
>> >> appreciate your feedback:
>> >>
>> >> www.catamaranresort.com/trip
>> >>
>> >> I hope you all had a safe trip back home,
>> >
>> > And huge thanks to Rudi and Jefro for their help in organizing the
>> > event!
>> >
>>
>> And an even bigger thanks to everyone that came to the meeting. You are
>> the people that make OpenEmbedded great!
>>
>> Philip
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Jeff Osier-Mixon
Open Source Community Architect, Intel Corporation

