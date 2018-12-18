Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50])
	by mail.openembedded.org (Postfix) with ESMTP id 95A097BE1E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 17:46:34 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id n8so16467747otl.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 09:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=1Q3T3tlue/zByBYTwiG9MK1F+OEK0wro2vrzf6DOyjw=;
	b=mG+ThfH1IWZ2jHiycFvxNBbUz4Q0uIcKSrPoX5Pc+hUiirXr9G05DOrHk115ka/cnb
	Hav5/KntepI/gHOT08aXQETjNyTuZDd6A19Jnku3SwK5/INvGpsHWXeefmFKJ1RX37MQ
	zvWZ0KO3DsM5goDs1y0LO6o0wg4EZUFkZEjOAJKajy5MUIrL5V40sO9ZyVstgjn4yDEL
	V3NWQz+fb9aiNNDKkIMBU+MPO589bT75LBaOI7OtkZVVjUizxk3N/zuBXz6HADD/zrfO
	EY5VpCLZ9ojmkML1JWNbx92fT9dboattXbT3knMLjNf7Fn4VijFhLz+WoDnpp2KYHqsR
	GIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=1Q3T3tlue/zByBYTwiG9MK1F+OEK0wro2vrzf6DOyjw=;
	b=VWXa4BCekjlkRJ0IiGHYk+1gxPGtsYQkUtIjsrL4cwzOITrYNRYhkonM8ao3lDip92
	briSBl1mGRHZrjGMrRibj/B7L6SDIc4mW7eTAZA297LL/VzawClRB+TnDnbBc/alpas9
	wpZw3VyadSSutG/rCijj6DtrTXCC/fegBDmRh2Scy2ZziUK+exDeKxcc589BXiQwnT9B
	F9b82+fGajCLRhe09Nb3DhG4v/P16kY0YPlhCyFpLEEVdnaSk0vgGw77WctX2rFRI0v5
	ZgNDlO7bHAJ+ACJoBX5r3vMGOwvFq5magisc0CgRuxtRQI7Jm1IhoJjNhss4CAAzL2K1
	toRg==
X-Gm-Message-State: AA+aEWaKW7tOCYi3Ln8GDr+9K8I+PL7m28jzs0/PADQddcJ+Uj5MJwuS
	B5CGz8M7KNCsEnFsoO1F8Pvx6eLejbW8usig2MpZSLme
X-Google-Smtp-Source: AFSGD/UVz0UrOuMFUrsY3bDeqUVFNC2Q7pUdjUrTn294Lx6BuLL8yyd3ytCb231mEuPH/6ZYnKka+KCvJRKUcED25fI=
X-Received: by 2002:a9d:5cc2:: with SMTP id r2mr12993276oti.367.1545155195384; 
	Tue, 18 Dec 2018 09:46:35 -0800 (PST)
MIME-Version: 1.0
References: <20181218163005.1330-1-alex.kanavin@gmail.com>
	<20181218170317.2330.98898@do>
In-Reply-To: <20181218170317.2330.98898@do>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Dec 2018 18:46:23 +0100
Message-ID: <CANNYZj_jBUHcFhLbnrZ9Uvg2-xNm-G=L5BXJmzK13_nq35M=Hw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJidHJmcy10b29sczogdXBkYXRlIHRvIDQuMTkuMS4uLiIgYW5kIDEyIG1vcmU=?=
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
X-List-Received-Date: Tue, 18 Dec 2018 17:46:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Dec 2018 at 18:03, Patchwork
<patchwork@patchwork.openembedded.org> wrote:
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 14c291e1fb)

Rebased patchset is here (trivial conflict in systemd recipe):
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alex

