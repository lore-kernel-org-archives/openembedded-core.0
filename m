Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id E3C0E7DFE4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 12:19:59 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k8so42745008iot.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 05:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=m5v4ddQ/uYber9qtMwgX0FZrvMOTsdql/BozvIJf0tU=;
	b=X9kAFbIRPHLRj3eMOvwKXxIpJICpRYdKkyb6W28NHonyVRPzKygJ937QTVc2RQhldG
	QHYWaQxmgZGlRLkTlhsTRwzv7jijqdBma1pzSLusgOSyO0cq8h0zpl6Ju2V3/PTqmJ19
	XczPuSXHZI4mJSuqM8AGolgaMyjSljmNCxrnOd3zArsTM7zkPEmytd9GhUeMc0qFybJo
	qDhrpcn8Uc6h2ZQW1MFRVDDw8ir2whi2ZBT2U9tP7ho5t14f/mGr5LfPQIjyY29O5ta7
	0frza5wVv+Bw/0C1qlG3HxYEjQGL4V+ZLXQj76f5Rw2/pQurEq+EiWe8SjHsweBB6rtd
	t/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m5v4ddQ/uYber9qtMwgX0FZrvMOTsdql/BozvIJf0tU=;
	b=CvDCgxVVNVINGSGoINt7nxb0YgcriLUCZ1ChK6DRNjpzryY6n4SzGhFK8wAnZXMBJ+
	f7YR1j53XajxI8HHVTAXmP51c+f7lkNbn2jaYAVoguKTy/ybphKyK3A8Yssr+bSWtU63
	xDqfAzm6bwHm/qafF+2nJjrkY8iwnakEvA0Mh9lVaXrGO/EB5fENgfhdq9VyyjFN+Kls
	rosiPB0+aAOPf1S0tlNLoPYEu/wPhh483iB9xISC2ES/QhZnyaZnwtcve2K9bwCu2GhI
	qjUqaCYegGoPrzBsu1UOD+FXB6l3SKkPgdJYdxZvgEmDJwdqHz0Ap5jeq7zMGTB8Jtur
	RSyQ==
X-Gm-Message-State: APjAAAWNfU5MWxaBDWjtLxWiOC+UmpUgyCzEcHUoOUzEgDjPPZPlAnuN
	oIh1JIO9gCPF3Uh5yPAfHQVoDk2Dq7mmhESmGuCNL6j6zpo=
X-Google-Smtp-Source: APXvYqwoYm6P0Zo4I3rySW4YEmAlv0zJMgpBnWUePUNXvSReJsvs3yls14oam+qhf6uuiJXrFZZv6yEmLY/YYvNZyrg=
X-Received: by 2002:a02:5ec3:: with SMTP id
	h186mr21746563jab.110.1562674800799; 
	Tue, 09 Jul 2019 05:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190709084334.28399-1-ricardo@ribalda.com>
	<CAO5Uq5RXK1k23fQZ2ov2vq5pomza=FzVb1umwyh2ArmVez44nw@mail.gmail.com>
	<CAPybu_0E1bZ9ZwzvJ3QaWRxd8fEnmzvS0rkpFF9YhpyuZ725rw@mail.gmail.com>
In-Reply-To: <CAPybu_0E1bZ9ZwzvJ3QaWRxd8fEnmzvS0rkpFF9YhpyuZ725rw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 9 Jul 2019 13:19:49 +0100
Message-ID: <CAO5Uq5QV8oj_71-5+SoYXigeTQ69QBcMkzJbM5VkYVg6y=Hpcw@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Fix interface bring-up on kernels >= 5.2
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
X-List-Received-Date: Tue, 09 Jul 2019 12:20:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 9, 2019 at 12:59 PM Ricardo Ribalda Delgado
<ricardo@ribalda.com> wrote:
>
> Hi Alex
>
> That would also be ok. Is this already on a released version or is
> only on the "master" branch?
>
>

It's on the v242-stable branch:

https://github.com/systemd/systemd-stable/commit/8fbc72f45f4aa84889bc8694a9ce662946464c37

-- 
Alex Kiernan

