Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id E8E9B6FE64
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 23:03:13 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id 142so945106ykq.29
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 16:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=lZ174yKud/4Pa45Dj+duDBM1EOHNe81qcjjtN8CLRN4=;
	b=jqTc2xvBWO4NFSHTqHzEyzJR1Bd22S6pcxmEswsEASvh0PRAY/eT11xzkTsdRnL/BD
	/+ug2olx+N6M8FZUi8JFTVufPUa9XnlozpSitYspIbZR3Gb/ctLWtsiOqGKxATgDzMDK
	Ld28R5nmkdbCCPygPa+noIfxudvs486hZvFpSi35OzVuH/yFzYAIUtqNizoG6Imc6dxz
	Cs7QGgRxbXpy9NAmSBsUyd+lMRdVOh4nwVIdgYVe2l2ydcP5dX4thk9IjAnG/798bNfF
	Nlk49bNWUSh068bYGdf45YQFrdXqnbu4J9dv//9P7CQaFrqm5MSTgGnw7gpUHC3bhm6+
	cLRA==
MIME-Version: 1.0
X-Received: by 10.236.103.170 with SMTP id f30mr9301820yhg.76.1409266994381;
	Thu, 28 Aug 2014 16:03:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Thu, 28 Aug 2014 16:03:14 -0700 (PDT)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C7CEBAB9B@ORSMSX103.amr.corp.intel.com>
References: <cover.1409251282.git.nitin.a.kamble@intel.com>
	<e742f96dea187a45c9f9f3ca9383565f1d460566.1409251282.git.nitin.a.kamble@intel.com>
	<CAJTo0Lb8_A1dyp5a20xjy+pxa990LSwzee2V8YT1ztO1UxtZtA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C7CEBAAAE@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LYr4r2WBBdPQeQWyHEhKYx_Fc-7DHKbSO57Rnx8_OMTJA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C7CEBAB24@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LYe3MdLf08HmpY=2FO1XMNi5KmpXdJ-t09Yg2SiMYCWog@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C7CEBAB9B@ORSMSX103.amr.corp.intel.com>
Date: Thu, 28 Aug 2014 20:03:14 -0300
X-Google-Sender-Auth: 0_8WquJsi_KH3r222Jk1al22n_A
Message-ID: <CAP9ODKoabWwGf7=KQHotYYLnnQw8c2A6U-3+=f4W0zmgPRaeHQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Cc: "Hart, Darren" <darren.hart@intel.com>, "Wold, Saul" <saul.wold@intel.com>,
	OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] imageconfigurator: a new recipe for boottime image configuration
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
X-List-Received-Date: Thu, 28 Aug 2014 23:03:18 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 28, 2014 at 7:13 PM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
>>
>> It will just be a matter of imageconfigurator RRECOMMENDing
>> imageconfigurator-data, and then imageconfigurator-data being
>> machinearch and doing the per-machine magic however it wants.
>>
>> Ross
> I see. That means the recipe will be split into two recipes. It would be cool, if it can be done with a single recipe. But that would need ability to mark different PACKAGE_ARCHS to different packages of the same recipe.
>
> Splitting the recipe into two has other consequences.
> 1. The non-data recipe is of no use if the data recipe is not present.
> 2. The data recipe in the oecore layer will be empty, so it can be dropped from the oecore layer.
> 3. With that the 2 recipes go in two separate layers which need each other, which is an awkward organization of recipes.
>
> Is there any better way to achieve the same without splitting the recipe into 2?

I think this recipe is small enough so I don't think adding another
one will buy anything...

While on that, can you describe some use-cases you see which this can
be used to cover?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

