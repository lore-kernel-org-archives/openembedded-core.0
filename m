Return-Path: <gizero@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6AAC3744EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 22:11:25 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id j85so4197305vke.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 15:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vZNuYHff72cdHZh/7j90oEGPcVBwPriA0IFxg29i044=;
	b=NAZyAFnZ0A4OBZApVwZZNWYC5eJYoqFHvwx+KhwgTrhRrAeLk5TantXVLIKsptri55
	5DLf7qqj+7ReMsJYlD4dnHVSrAyE6+5t10qSQOLCTTNLD27yiv8nlZk3dcJSr53gSKIW
	xOabFQdegKk/JJcvefeimwehooR9EEidfAjg2jKzYp+07VjjDUWULbGecmlgILmEJpsq
	NhwI25fmt16/V3Ni7P1vZRtRP4pkhCucmiA43Rg7i0gdQXpbGmVOh5Auc+lQjp9i49cr
	bXp/lGeS7GoZiPLBPnsx0QYWVB4dZySQcLFvth1umePAJKaJN1xBZm1hmIHi4+KgHpQI
	5bUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vZNuYHff72cdHZh/7j90oEGPcVBwPriA0IFxg29i044=;
	b=d4LKLnRbEGidJ2n78qw7zmNNV4SMtZd3bj7yEPxK8n03gtfwExzeSbYeHgRl7BvyVv
	3OcJg7VHqtnmeAUZR4VM2RrnEoKEW7h1ryOc7W1v/wIwOIph4NVqc9jrUHEpCtEGh6IK
	jsR2rBWcGJlSLYIcYj4gGydNZU/2yKc6sllyL8cuI7G6u+GnDsIXN/rJqM/IeYT/DEbv
	ieqAW8GiRtJ75jrpMsqlKUn9dL/mrkDgwB6kn+oDpGB1Cep7+KWTCF6w7mXI1oVq33N9
	RhCvJZ8vxVu3tbzNq/q/SvuNoywz41OxBVVW53ZMEd/wS9gfJLQZhqBHPg3y60Y1gpK6
	j7+A==
X-Gm-Message-State: AElRT7GPH+2UUywuriViDuz04Fvi0UmP2ksEtufL+q0ACJ9g7Z8fzv2d
	rR+fGsnfjepmriGu5WXXwYZKg0qwFHqIr35bi80=
X-Google-Smtp-Source: AIpwx4/DBJGSXGEpauXGc9GA6viknH1Ibgh9S8LPQXJvS1kQpCKItJGes5gK/WJK+vyp4xZYgc/36hzeZG85BXB5YNs=
X-Received: by 10.31.185.144 with SMTP id j138mr6517087vkf.52.1522361486654;
	Thu, 29 Mar 2018 15:11:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.50.3 with HTTP; Thu, 29 Mar 2018 15:11:26 -0700 (PDT)
In-Reply-To: <CA+chaQdYG-kNDqiStA=yg1nGjLH_pgH7vcm6Db_kxZ+Bt1pWSg@mail.gmail.com>
References: <mailman.363.1522325586.1651.openembedded-core@lists.openembedded.org>
	<CAHUNapTc-iiZ6vbRV=J3pt5EQy-qJJbgkwzZKhpAkfC3pgzXiw@mail.gmail.com>
	<CA+chaQdYG-kNDqiStA=yg1nGjLH_pgH7vcm6Db_kxZ+Bt1pWSg@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Fri, 30 Mar 2018 00:11:26 +0200
Message-ID: <CAC+thW3gJDv_RGKAhXxkXM3rjAEDk8-_Ew2rszTpij2n_SwAtg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: confirm 6bb527bbc2e6d9a2a2165aa081ea1271ece07fe8
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
X-List-Received-Date: Thu, 29 Mar 2018 22:11:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 29, 2018 at 11:56 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I got the same today.

Me too!

>
> On Thu, Mar 29, 2018 at 11:51 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>>
>> uhhh.... gmail is on the bad list?
>> anyone else get one of these?
>>
>>
>> ---------- Forwarded message ----------
>> From: <openembedded-core-request@lists.openembedded.org>
>> Date: Thu, Mar 29, 2018 at 8:13 AM
>> Subject: confirm
>> To: twoerner@gmail.com
>>
>>
>> Your membership in the mailing list Openembedded-core has been
>> disabled due to excessive bounces The last bounce received from you
>> was dated 29-Mar-2018.  You will not get any more messages from this
>> list until you re-enable your membership.  You will receive 3 more
>> reminders like this before your membership in the list is deleted.
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

