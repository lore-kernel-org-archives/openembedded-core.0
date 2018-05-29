Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8B1B960401
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 18:26:11 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id d4-v6so10658777ual.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 11:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=awbWQ38F26ZH2yqa1jNI4bHKTw2+vHHJAfVSs+3hviI=;
	b=TJ3VdlL09yn4bDqsqy7pJUkLBU+as/PettvIEOUVmZu1XnprezlMC6SiuUDp2rv8pt
	3Zr0vHfD+p2FYRXfNI9LxdbP3F37HP+3fEElHu72ZuYnTjaLnf0JhE704PG/r6aWU65L
	h/josRO+G/LNIKHJG7l4Hefuui8DfBiOyX6RL+KMt+e1DbE1Z46cau2R0zq8LlKl5FXt
	5vzmZfLJbUtITcNuDjZSmSYSUkT2NxauTgnckpOl6HvYNheS1GvZJyIPvxq/qdeu28DU
	sYJDucJYgBmXH7xFVcJd9qFaR6yGYUfVjG79paGJMWpQsZnJW2fORb8E8HxL9yDa971U
	nXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=awbWQ38F26ZH2yqa1jNI4bHKTw2+vHHJAfVSs+3hviI=;
	b=pG/kYKP5Ke0fxhYEWkrApBFI0862n0FwrlyoYl+UwlFjQmtZx6jNemglJFfpgQmrex
	jZL5TWoql+zti0dCPt0X/eV7N8QkKuGg7InZIFhx5nn2Hy0Tg7YuDxTx3sn9hxCMlf4Q
	FL5YPlIWgthGvSBUWk1WYtYk1tgWUW4oSzEgVobBLBm9Yc0H8/HcK+0E7PO7O16EfkgY
	4UNSkFAJ6B40+utuNzgN6rvi/33joOiZ6CHt02G/QnfiCiyTYCWwiF2cdCkaD0sA0DZ0
	FU7GgIFAE3YQgkM892q8H98lgcngJZIynJ0R6Dl65GSSJ/AvtThU1KZy20VArART2QzL
	BlSA==
X-Gm-Message-State: ALKqPwcvu3zhgJdnHlNjm2ZHZKwg00yaSfBlkBwFEn6gUi7bX8QAnq0N
	mCoLinKf8Cd+5CTzfKE+6q+KGpm/NTMuzwNFNYk=
X-Google-Smtp-Source: ADUXVKI/XDm7nGBRtGa30FSpkO7K4Tsv4AxsNsgi/43nzgU7CVzEMGQpl367rlUVFMIppY+GYzMP7fqwKnBj9hCRut4=
X-Received: by 2002:a9f:3352:: with SMTP id
	a18-v6mr12001825uac.38.1527618372081; 
	Tue, 29 May 2018 11:26:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Tue, 29 May 2018 11:26:11 -0700 (PDT)
In-Reply-To: <CAMKF1srvQZ7z3xYaNJU9M_QQNq+pBFftSrJNBWwhcXQp0XDQPw@mail.gmail.com>
References: <1527215248-7224-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1srvQZ7z3xYaNJU9M_QQNq+pBFftSrJNBWwhcXQp0XDQPw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 29 May 2018 11:26:11 -0700
Message-ID: <CAJ86T=XdWPKG+EURX35cgpxbOL6FetzKdoND+=aXte1MPcxdtw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dropbear: drop obsolete patch 0004-fix-2kb-keys.patch
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
X-List-Received-Date: Tue, 29 May 2018 18:26:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 10:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, May 24, 2018 at 7:27 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> This patch has been obsolete since 2005:
>>
>>   https://github.com/mkj/dropbear/commit/736f370dce614b717193f45d084e9e009de723ce
>
> Seems fine to drop but I would like to understand why we carried it thus far.
> What is the history of it in OE ?

It's older than the git history in oe-core (ie it was added in August
2005 as part of the first commit to oe-core).

The patch looks like it was initially created in March 2005 against
dropbear 0.45.

In 2011 someone (incorrectly) added a tag "Upstream-Status:
Inappropriate [configuration]".

That's about as much history as we have.

