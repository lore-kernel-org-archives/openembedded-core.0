Return-Path: <alistair23@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id DE6B865D35
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 23:40:13 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id r68so7294119wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 15:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=mZuSrtBFwpM9fUXcjpFonwbuxJ4D5hoI5Hwwm2nvrJA=;
	b=poHm7R7D4CySrueGi+HxSmnU5yhgtZtmHQ091DgMRfExESDXeQZuAsTOm+EYUL2heq
	SvpqP74IPHRf+HCqKNi2yY3a/uB03oozRDZREURbiJtPbjvTocIPWu+fFv2n0KV9NGSj
	wCCfYwamVYX9AY3zYaoy6shTZU482qLXd0KwXVu4UbZge/X4V+nP0oSsbtdY/n+kNO31
	97hrWvmPXoOUz2LGY/IILJTzyPtHhJC9s8K72GyU7VhngyKPywbp8kG54KPcHGJGjxM4
	R0wEYjps8/oCeeLRkVpZHJ84T2NEeFhVNk6aF4VZ9VvxXjJzBrAnDEKf98kSf7sI9AdK
	OMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=mZuSrtBFwpM9fUXcjpFonwbuxJ4D5hoI5Hwwm2nvrJA=;
	b=eKF7OQrnGmw9BTMIEQZVMYXVQ/gSA/Ur3c7fqBSnDPD6sXTbVUDAw18f7DwgIlRurN
	13g92zH3hq6/aphg4o93o/RUOAmeD9RijpEpUQZrSjeUeh/o8u0e5Y0RNYd9ymCtl0pu
	p+6oMI7voieQb5++T9hvTWbnvP7oza5EMvJPxpitcYRH/MPOgtfA44rrOQQpw7v+itug
	sE/TBdg+3wI6U0npxSm/6UqzglWyl7Wb22/5TCUPLekETvjVvbyaCRBUOp9kTAj6Ng8l
	m6h8zxGlz7cpHUkU40PuDmIgiv8ae3T3R8epUnvJFYdLEjRfPhmlU4GJS7dyfxzlrRSl
	TM4g==
X-Gm-Message-State: AJaThX7qtU353t3FwrVaRun0idPsxlB56vhk02A2vvw9iDNnkOLJrs9H
	gnVJQ9tl8EvLM4SQBt0wdAog9g8cfLqa6oky6GI=
X-Google-Smtp-Source: ABhQp+SmqOfq6VHu8sE6UIGTECX894Uva77RU6FQpfOorLrZ+NmIPer6Y1x3ScHqFONv1+ORGv4p429HSXG/RMSzBEg=
X-Received: by 10.28.230.77 with SMTP id d74mr513679wmh.75.1510098014864; Tue,
	07 Nov 2017 15:40:14 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.147.11 with HTTP; Tue, 7 Nov 2017 15:39:44 -0800 (PST)
In-Reply-To: <90db7b51-f472-ebb6-2f45-c2fc3720443c@linux.intel.com>
References: <20171107001706.10052-1-alistair.francis@xilinx.com>
	<CAJTo0LYkCH6TNwGU27Av5-2UwpXZb7iogyM8ScQ_b6JA5jibFw@mail.gmail.com>
	<90db7b51-f472-ebb6-2f45-c2fc3720443c@linux.intel.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 7 Nov 2017 15:39:44 -0800
X-Google-Sender-Auth: qleorVTY25NWCRKo6xaxNyomadE
Message-ID: <CAKmqyKM7evX-c_OctDz9-rU=CS7mNweyOjgn_hzWnAqQnjWwuw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: Update to glib 2.53.7
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
X-List-Received-Date: Tue, 07 Nov 2017 23:40:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 7, 2017 at 7:04 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/07/2017 11:58 AM, Burton, Ross wrote:
>>
>> Odd major version numbers are development releases, so this won't be
>> accepted into oe-core.
>
>
> Not to mention that I have already sent an update to 2.54.1 earlier.

Ah! I wish I had seen that earlier.

Alistair

>
> Alex
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

