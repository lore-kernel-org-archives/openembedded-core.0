Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7E1A87C325
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 10:59:05 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 32so3546748ota.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 02:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vdzTmM7jkM6T3NgvkHVqi0bX7iXwNuxTBQlqOBC0GfQ=;
	b=NOrmBsTni4BGXOkfQHhMB2FkL78uSiFgLP08XVb1MqiZNMSAwKUkOjPkJIv/2FpxF0
	er9aWpcigM1XpRcURpVL7YXSMFwCRCX2q2kTR9UkAeGjVKXdmLb/bdPR1G0CkThfCj9+
	PDjK2oaJIKy+F8+3DhhUFQEg1s42AJ5AVwM0UXp1pnAN/g4IfhV0Bkk3N6fkVpSoUl15
	m1NDXjq0OpWpAQvMRf57ughG4S8m2OCkpBn/SolRmgepeBF6KOA+POd8x8forFW01LJU
	TgFhPM97/CiIMmt1NC2ctMGvugF/QrChrmnImYszjOc8ytx6jbnO47njb1ZFt8n3+2XV
	ImTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vdzTmM7jkM6T3NgvkHVqi0bX7iXwNuxTBQlqOBC0GfQ=;
	b=XHtEgGacJgyB4qq5+w5zLYK1imf88fb4L0hJasu9bOdl2OY7sl0xfjD8ucg8OWjlml
	aRm2Mn0E2gTPuIcRFJcWGLdY3rXYBQ8adBFBaNHt9e881JxrSovf8Zmzs4iRJUDuG8Fi
	Xr5uFd+cFFn5U83Oj2usdUSYAb5UKr4MeG9/AiyIjh3GKqd8wa2R6x6kMrm7IBkobgPf
	CsZxLkvaETMa+oovP8ude1PJCG/9mNcbgU+ap9fcoQ/EsSHF8rON8eaVEOCr+ZI1rMAR
	0rYaZjRW9ZgUa4xHFDqQ8jAGI/qAMkugTTxWmPRkMohVV4yrRnjDIvabFG134EDurx6p
	QoVw==
X-Gm-Message-State: AHQUAubGrGoNjmh5wzI8dj5X2gMxRfnGa6+LMGn6fayK2SZmRpt19umr
	eqFWNeIaHOv1rJA8qUzK9rE/SyU/4we38BfP5wp+Lg==
X-Google-Smtp-Source: AHgI3IZEA4ajfw3qaClN5R+uvC6b5OpJEUYq+A0l4ggitG7DLyVaSjSWvBypsSQp/TIPQ9rnyvWrkO02AoV1xjN2UW4=
X-Received: by 2002:a9d:5cc2:: with SMTP id r2mr3052668oti.367.1549969146575; 
	Tue, 12 Feb 2019 02:59:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549637121.git.alex.kanavin@gmail.com>
	<a85aa0f19d694bd828ddde75c92d96bd7bbf4778.1549637121.git.alex.kanavin@gmail.com>
	<c7c7fd8c-6e73-ab1e-44bb-7df106c20c62@windriver.com>
	<CANNYZj9_cnyn92RBOQC+cs4iWitwvTGgKWFOF9DjgpW7zkbrSg@mail.gmail.com>
	<97a2de37-cc7b-3731-2933-b59aeae92446@windriver.com>
	<CANNYZj8-44W5RyA+VF_7QPWxdouh=GbHtKwutWKeVwpjTgP_ng@mail.gmail.com>
	<a28722ec-cf05-d7b7-0502-f471f747aebf@windriver.com>
In-Reply-To: <a28722ec-cf05-d7b7-0502-f471f747aebf@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Feb 2019 11:58:55 +0100
Message-ID: <CANNYZj-Orgz_uKbT8_o8Pdr=vZgGRQtTK_K63rd1Ue=S8SvfsQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/12] qemu: build target variant with gtk+, and nativesdk variant without sdl
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
X-List-Received-Date: Tue, 12 Feb 2019 10:59:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Feb 2019 at 11:20, Mark Hatle <mark.hatle@windriver.com> wrote:
> Reading the above, I didn't know why you changed the qemu config to enable gtk+.
>
> The commit below has the magic line:
>
> 'As sdl is deprecated in favor of gtk+, it should not be the default.'
>
> Once you add that, it's clear to me why the change was made if I ever look at
> the local.conf.sample (using git log or git blame).
>
> (Sorry my reply had been delayed, I missed this earlier.)

Thanks, I fixed this now.

Alex

