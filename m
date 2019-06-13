Return-Path: <alex.kiernan@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1C77D7CBE4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 04:06:42 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id m138so14567295ita.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 21:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DtE8lQ6I0YXuxu8oGCtXslMPxCqpPhHR2lqE4xzVSbs=;
	b=HpmV++1UDqMu7Jbla6BF/Zq6Moz0XQM6OHHH2Vz+u+UiF+LtyELNtMrmsW7m697jYe
	+9EKCLDRMqUOvqvVrWbLb7ylTJMvBmeLx5IWemOHRPKLMfN1KD9PzSSYuEiuZvDwb5Kj
	VqISIsYYDB0K6X8xjb6Gkw7NG5ln/ob8ArGfkFBERuFp5GpWOAG4PByPxsk2M8Y7/Rxn
	p2LjtvBhQmPCq7SiwZJ852AeIOCptQ3TEesZJs1ZHl7Rpweux2XBXaW90iCuZYzCrubW
	psv0QBC6M5EpwckC8OiNv7xwpW8c+XXswEjxp4tZcq7X9q5Tu5dw3vEwC/AtL+s0ZYnB
	Vxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DtE8lQ6I0YXuxu8oGCtXslMPxCqpPhHR2lqE4xzVSbs=;
	b=eoDaDyOPTaamKfg4qRc29LxyzPOnWfPvKrdJcd55HRTUXNNm7+/np32fZPtnoW1A6n
	oXhoyBEQwqZyt9Fr2jgWXX5zi1L8XmvLElBFJUVUxRS1fzmvPVvJFXJ3X3DDhAF3/YfU
	9eu94dyd746ZggQPr/kG04bP0YxCLekObT2MqqHB2EGvQ9Y1n6GnZ3BB56qj4FFB9qh2
	2S1NxketPwzT4IxBtnXVPgd+GX0imwSlymfYTpDa5LbkfHxvkQnKkARvpvQB3H8LaL6O
	YZ2UrGmbZ08Id6WauqF0nVhjEMyE59Anvn2UoVMpLzVQyRDd9dN8+s5HTnyr+BbXFh+A
	PubA==
X-Gm-Message-State: APjAAAWhjEYbkmh9FWvr9J3sGG192whMfeoxsmZvRQ8X3r9kZw7u5iMw
	aneETYchfX4O7DQoO1MsSvcs1bzrJTw+a5qowOc=
X-Google-Smtp-Source: APXvYqxjK4YH6vNmJRdJMhjIMOulwCMXmVDcKj/7IQGuSrt8lL6sdGRi2h9qgeCJ68dhMbuY2gmhJk3FUXrJxNqjFw4=
X-Received: by 2002:a02:a493:: with SMTP id d19mr54531944jam.22.1560398803096; 
	Wed, 12 Jun 2019 21:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190612081559.5102-1-alex.kiernan@gmail.com>
	<51dc74acacf2f1daa52a012d083ca2ca56b67bd8.camel@linuxfoundation.org>
	<CAO5Uq5SBNF025u6metFbzeNfSWYOXiYTP5ePR_u1Z9++L_ds8A@mail.gmail.com>
	<9cbbc692-2702-f3f4-199d-ec06cc0f212c@foundries.io>
	<37f5b95f5e9972f1acea72c332c8069f56d7f7a0.camel@linuxfoundation.org>
	<656d17dd-5b77-d3f7-3764-efa5fe5f98e5@foundries.io>
In-Reply-To: <656d17dd-5b77-d3f7-3764-efa5fe5f98e5@foundries.io>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 13 Jun 2019 05:06:31 +0100
Message-ID: <CAO5Uq5Sg6BfL4MeuN8BqbYRNwW2h3A5ZDPJxTD7jhWqjuEA_0w@mail.gmail.com>
To: Michael Scott <mike@foundries.io>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: uboot-sign: Check UBOOT_DTB_BINARY before adding deps
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
X-List-Received-Date: Thu, 13 Jun 2019 04:06:42 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Mike

On Wed, Jun 12, 2019 at 11:59 PM Michael Scott <mike@foundries.io> wrote:
>
>
> On 6/12/19 3:21 PM, richard.purdie@linuxfoundation.org wrote:
> > On Wed, 2019-06-12 at 14:17 -0700, Michael Scott wrote:
> >> Actually, you can ignore this patch.  We debugged the actual race
> >> condition contributing to the confusion, and that developer will
> >> submit a new patch with that fix.  We can review if that patch makes
> >> more sense (even without tests).
> > Well, this patch merged earlier this evening as tested passed. Is that
> > a problem?
>
> Not a problem at all.  I believe we also kept this change when we
> debugged the actual race condition.
>

Wrong patch you're pointing to here? I'm guessing you meant
https://patchwork.openembedded.org/patch/161440/

-- 
Alex Kiernan

