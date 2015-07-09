Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 785C460557;
	Thu,  9 Jul 2015 14:57:12 +0000 (UTC)
Received: by pdbep18 with SMTP id ep18so166474866pdb.1;
	Thu, 09 Jul 2015 07:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=ESNRoYT5EzxMV28IJ19OdWxGVuAzc0CBoHIuU2kLBIk=;
	b=C+DJzfsQHtsYbcABe1LyhcZOFcwLnlhfECpADP0RuufmC/eC3eySyAiCMMKLb679Ic
	cAxiVjxtouBirEVm4swPuwdjwJlnN9eX5/Dt6YzMjQlHCztad+qrmc2wOXieRqusQL4Z
	+szDNg5ksOgfCA2m9S/Iucv5k5Ui1XT8DFD/9h/FjBSZ/k4Fxrha0pUUp3ITgJHoB3WS
	bnzbVvaI8fhQjZvnPqpnorQpXwVdg6BVnuH8BpCn/falHxJPPNNQAnjnRPvpV2vCB8U6
	ZxzrPvyQTQo7Z5h8Ewb74qhrQTKSE7V1nQWLLKx8pvVXUMlzN2NmKp6SYkagd9+T9Ne1
	+xjA==
X-Received: by 10.67.4.4 with SMTP id ca4mr32040833pad.80.1436453832461;
	Thu, 09 Jul 2015 07:57:12 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:1f1:f366:7a5c:28ff?
	([2601:202:4000:1239:1f1:f366:7a5c:28ff])
	by smtp.googlemail.com with ESMTPSA id
	qp10sm6241740pbc.88.2015.07.09.07.57.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jul 2015 07:57:11 -0700 (PDT)
Message-ID: <559E8BC3.2060300@gmail.com>
Date: Thu, 09 Jul 2015 07:57:07 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
References: <2219152.1ss8pFxefq@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <2219152.1ss8pFxefq@peggleto-mobl.ger.corp.intel.com>
Subject: Re: RFC: libav vs. ffmpeg, redux
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
X-List-Received-Date: Thu, 09 Jul 2015 14:57:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 07/09/2015 03:24 AM, Paul Eggleton wrote:
> Hi all,
>
> A few years ago we made the switch from ffmpeg to libav (a mostly drop-in
> compatible fork), with fairly good justification at the time. However, it looks
> like Debian has just made the switch back to ffmpeg, citing a number of reasons
> - most notably more responsive security issue patching in recent history.
> Here's a page with their full reasoning:
>
>    https://wiki.debian.org/Debate/libav-provider/ffmpeg
>
> Gstreamer (gst-libav, specifically) has also just recently made the switch back
> for its internal copy:
>
>    https://bugzilla.gnome.org/show_bug.cgi?id=751607
>
> What do people think? Should we be looking to make the switch back in OE as
> well?
>

That make sense to me. Also libav has LICENSE_FLAGS = "commercial" so 
the change which will simplify things too.

- armin

> Cheers,
> Paul
>

