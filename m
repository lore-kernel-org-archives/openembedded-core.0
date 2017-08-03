Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 36CA871A60
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Aug 2017 14:14:55 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x64so2372035wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Aug 2017 07:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Xs43EU3m7moMLNArX0f5hvUvKBqvfXuz94q9HXe+JD0=;
	b=pxFmGRWLDIauI5LVxezNBDYxBCC6ICLv/WkLsTIl9Q1InWBCJFyQtqqQ+CRhhfj8NS
	MMR5N5h2rSvd0t6OYEv3sCj2XPustoeR0GV5mBC0VFNZ1avDyRAxnD44ZhohCMvequcM
	4IpMgwfYQsxpeoZA2EllfQovKWNNqT7mqitztsRtM0VtC7ZfPtjToYOUsi2agzW3IDEP
	CQWQspfP9LwcZg81lis+t28tkTe5ued8Pja/E8H/PrePiRCY9IYR9ONthgNq6wIoK8Nb
	fIunZ0lwPFm+WhMg+LimpBI4dNjQO55WO9GUIjo72IQak/4TQfG8nTnhwV6F7U42R1Z6
	vIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Xs43EU3m7moMLNArX0f5hvUvKBqvfXuz94q9HXe+JD0=;
	b=J08RZsyKuO6Tl62ascUdjdhFOuwa1YW96qY4gIDER4aysKiqxN0wdtnhipi1GCfl88
	TBMvC7/xB1y5p4EE0jbI/SCOGEOGdphv8QoHgl1EW0nNkFQQiYzaVZwlUe1X15tpvLHZ
	4DX0YknH4LOdyL5cA0TzkxCOe+1x2/opFyeH/QLIliRN0qui9NTHNC9d1KX8I4oapcBd
	w7RNzFce/R3ebDwadj/e7zhrGSkAQyW2BsXcaJNdSsk00itPr+ZkkhfZLWrWgZKIBGDv
	9l9Z5dsNOz11MV7dw9gmoZ99CM7BI3j4oquHG+riZAkKrZ46tT8c+k4J/e2SxisirAIU
	lyqQ==
X-Gm-Message-State: AIVw113Fx+PJ0Ych0CfMnelyI4enctScrhjupk2nQYi//Pv1QybCB6oF
	QGWNCvFOR2lnNg0RDIS+wDfavK7g+Q==
X-Received: by 10.80.139.65 with SMTP id l59mr2078292edl.52.1501769696678;
	Thu, 03 Aug 2017 07:14:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Thu, 3 Aug 2017 07:14:26 -0700 (PDT)
In-Reply-To: <CAJTo0LbMdiJHrzHSZ4ONtBeso1zCkR+vDZuYeuZvBSD+zF4pPg@mail.gmail.com>
References: <20170801163443.10899-1-raj.khem@gmail.com>
	<CAJTo0LYexDbJbkWb0=v1L4cjpEMyw5gL8NmcSTQd9QXjnF4_aA@mail.gmail.com>
	<CAMKF1sossdZYGd9QFunkAHKBxUUikus8N18MKa-fNckLpWerdw@mail.gmail.com>
	<CAJTo0LbzivYA=X5=n6FnbJ2jJpuymrcp+YEvRwmEk1t6O85vaw@mail.gmail.com>
	<CAJTo0LbMdiJHrzHSZ4ONtBeso1zCkR+vDZuYeuZvBSD+zF4pPg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Aug 2017 07:14:26 -0700
Message-ID: <CAMKF1sqNJy8r6eqRqeSjgRJfDDGK85x-OMRJ5v=-YRD12qYbMA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Update to latest on 2.26 pre-release
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
X-List-Received-Date: Thu, 03 Aug 2017 14:14:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 3, 2017 at 4:04 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 2 August 2017 at 23:03, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> Build almost anything because it will need glibc-locale.  Sorry.
>>
>> I can throw it on the AB to see what fails/works.
>
>
> The autobuilder, for once, is on my side.
>
> https://autobuilder.yocto.io/tgrid, the ross/glibc row at 4cb48130d80a.
>

I have sent an update to move to final 2.26 release. Please try that one

> Ross

