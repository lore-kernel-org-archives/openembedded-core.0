Return-Path: <pbarker@toganlabs.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 85B0977F90
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 14:35:04 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id p46so8537928wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 07:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zCkmLtVuButTePh91BoA1odZTLjqj07VMbZIC4E3QME=;
	b=oRig1nyTgxmF4/r/zFZTVC+4MivWnHiK41w9rW1IScquVz+jsv0fCcp1jxH6GCToNE
	Yab8Dzg5dgi7USxiOLJxlf4IUXKUZuslsP6N0aOevj7emkFN1ql/4lOGav2pfXxIcaGY
	V+iAoaTT9PL/wB9Ir1opJH+fx51506wUPqK/+9oFSU3QVq2QyMgWs4TYBHlHvazwIvAi
	0LZkDU2QuOBn7hPdr63hhI2wZzS7PXrVY9REkcoBH7FbKTp25eCC4BZTk+AD+posafwI
	ojI96/5Kss6y7ws9DQFcuTK7CWPmR8VklHWOk7B1I8KyZZU29HzO6ArjTQilgm33CyrN
	sYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zCkmLtVuButTePh91BoA1odZTLjqj07VMbZIC4E3QME=;
	b=lDs8D7dONu25tRNU10KnIhRm3NtgztEMbqc2ohX52bDv3RTWHB/Rf7XKsudp8hrHMk
	hYKTq91cdNEGHhguO6lzyRd5EKQKVVfx9JvRod/WDmgqp1xFlZbrlqNXnIbfc88xprWK
	PJWnwhYLY7pS4Yh6300zyoGuFuVWYv+S0jCsc3AWCCYeXpoSTqObO2UEzRCESWOMGu80
	k/JG+PldDtbrtkONneHDqxRxYDu/ID9+gY51+Un0HruWGGYJDR7T4VCQXGXo3iWuZnJn
	QCiGvU+KNdqPDuaKNAKgwn/2y6p+boZSrwIzOXdVUaKzqiEzdVFL8AwOsiVAcG/0aEVh
	bXCA==
X-Gm-Message-State: AHPjjUiXrpd+uWZF5gE4iaCzcMI9T93zGmgm41H2bcmsBUNJPp8akvAq
	m9CkY3njk9ohhGlA8ba1V7ycCWlCNwXYC/ZWf0ypGw==
X-Google-Smtp-Source: AOwi7QCDkuQDbs3yxk3wZE5v1QiFaiufYdmoyUannccgkkROKR3gRpDZ5nVvbS4uCasRZ33eKQ28qhH6V3f7dqjoanc=
X-Received: by 10.223.199.136 with SMTP id l8mr18897272wrg.121.1507214105274; 
	Thu, 05 Oct 2017 07:35:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.173.139 with HTTP; Thu, 5 Oct 2017 07:35:04 -0700 (PDT)
In-Reply-To: <CAJTo0LY8Z+qqGHXuBNAD1_4eS-fXjhL3VcofkbeHfp6aaBGhaQ@mail.gmail.com>
References: <CAPyrkgxRNsTbD=o7op_xi7T+f85rT3-4XF9d0bvkqVpvphiKaQ@mail.gmail.com>
	<CAJTo0LY8Z+qqGHXuBNAD1_4eS-fXjhL3VcofkbeHfp6aaBGhaQ@mail.gmail.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Thu, 5 Oct 2017 15:35:04 +0100
Message-ID: <CAPyrkgxRjHRF9ALg9QwdUPdXAsetFNb9iUCQZNw+GtJsz+hM5g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Illegal instruction when running go binaries in qemux86
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
X-List-Received-Date: Thu, 05 Oct 2017 14:35:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2017 at 3:31 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 5 October 2017 at 15:23, Paul Barker <pbarker@toganlabs.com> wrote:
>>
>> So my question is: should we just set GO386 =3D "387" so that it applies
>> to all go binaries and accept the slight loss of performance on x86
>> systems that do support sse2 instructions? Or should we make this
>> MACHINE specific so that sse2 instructions can be used where
>> supported?
>
>
> Definitely machine-specific.  Need a way of mapping from OE tunes to Go
> options that control the instructions used.
>
> Ross

Looking again, we already have go_map_arm() in goarch.bbclass to set
HOST_GOARM and TARGET_GOARM. We probably need to do the same for the
GO386 variable.

Cheers,

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

