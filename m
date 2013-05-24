Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id C827561F47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 12:43:00 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id jw11so3401674veb.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 05:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=19cGLEtu+YQL+xeWPpuAQlry3uMg+xSA17iI+oCJD/w=;
	b=KN+Fzf1W33spwFaDQStYRj392cilim6Q4yxHMCZ3cvgd9Q9G1p9NUBbCdy9x7E8PPf
	2ePwLR+u8ocJSRnoXJW+vP/xLd9hgVEMmMLne5qVFpo5sMhjjEisg4Lt092mVClAdnM6
	YjvxUo0gyA8cKqkCLOO1u453IW1xP5Yf3NCT/mF9yNW9LST2jkx/5KPWzr4wa+5hDRYM
	fVK8dFoetiMSS3DRiO9krqAtsS9Au+hqYYVN/90DVR2Ztt5bwYZf+2AY9YeN9KkJzN/A
	Kd0N4OSeiBa5evtM8WueSiCRBmbnDGZlM8m3sfAWFUz5rsH2fN0YsBWKo3LeR6gAV1Bq
	cekA==
X-Received: by 10.52.165.99 with SMTP id yx3mr7018845vdb.34.1369399381304;
	Fri, 24 May 2013 05:43:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Fri, 24 May 2013 05:42:41 -0700 (PDT)
In-Reply-To: <cover.1369381416.git.cazfi74@gmail.com>
References: <cover.1369381416.git.cazfi74@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 May 2013 13:42:41 +0100
Message-ID: <CAJTo0LZqh=GWQCQDEMGYm2HVzguoUoJVvLsAtiBLKkB64O6zkA@mail.gmail.com>
To: Marko Lindqvist <cazfi74@gmail.com>
X-Gm-Message-State: ALoCoQlaMEl0FoE+VPe0ohdjFvtGlNx/XTtUWRLwWZfwzZCrtVJ5NWlwfbUqqRnqyzJdL+kT7Wwt
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Low-hanging updates
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
X-List-Received-Date: Fri, 24 May 2013 12:43:01 -0000
Content-Type: text/plain; charset=UTF-8

On 24 May 2013 08:58, Marko Lindqvist <cazfi74@gmail.com> wrote:
>   freetype: update to upstream version 2.4.12
>   harfbuzz: update to upstream version 0.9.17
>   gtk+: update to upstream version 2.24.18
>   curl: update to upstream version 7.30.0
>   zlib: update to upstream version 1.2.8

I'd prefer to see zlib using .xz instead of .gz for size/speed, but
apart from that:

Signed-off-by: Ross Burton <ross.burton@intel.com>.

Ross

