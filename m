Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id BC95B6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 13:29:48 +0000 (UTC)
Received: by pacwv17 with SMTP id wv17so86088307pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 06:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=HeaxNdkV9LQv3+7JN8S5GV/XldU/EntC9DLFmfVcXQ0=;
	b=VJhdPATHMV7My9aFmUCOJgY6Fpy/DwcoVkROBWklu/CVj4vskjJAN/gc3sADF3CXBI
	TBPLmOrU96u970GC7zVBOCNGwUTTrGEwkZDK4VXahVzGyIlkYv6LQeOsyNug0YJ56Miu
	PKGh+pKs1ZyomF0knz57SAoDy6YW64yj8UJe1chR5yolq15LpzYuPbpydcmATYJ4BSdK
	NcEqcFZit0OJ5XmP2xSqT9Xd7dPappzNSyMpP5JyOIZdDzNNXI+2wZLA67kvt0iQQrcL
	kRrcqJ0Z44x86apLoaeBCIX7l42NVtlX2xPWCUubst+Xdc4epHAUIntEH7+Up2zCgEDl
	txIQ==
MIME-Version: 1.0
X-Received: by 10.68.226.4 with SMTP id ro4mr8302049pbc.108.1431610189213;
	Thu, 14 May 2015 06:29:49 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Thu, 14 May 2015 06:29:49 -0700 (PDT)
In-Reply-To: <CAJTo0Lb8ZD_X-X5mxF9XQ5TROUJh1hYQYQV5xwn1WuZmzTSwMg@mail.gmail.com>
References: <1431343607-2820-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0Lb8ZD_X-X5mxF9XQ5TROUJh1hYQYQV5xwn1WuZmzTSwMg@mail.gmail.com>
Date: Thu, 14 May 2015 10:29:49 -0300
X-Google-Sender-Auth: ubOd5LmizQC7C2RB9f8mX3zwJy8
Message-ID: <CAP9ODKp0AL6Lf0_+dyC2UUuXNuNQnhi-h5WfAw=i5jyK4KVV3w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: Move EGL requirement for Wayland
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
X-List-Received-Date: Thu, 14 May 2015 13:29:50 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 14, 2015 at 7:33 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 11 May 2015 at 12:26, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>
>> The EGL is used by the Wayland backend. When building using Software
>> Rendering and without Wayland support the EGL backend is not available
>> so we should not require EGL for GLES2 support.
>
> I think we should make the PACKAGECONFIG block be more explicit, and add a
> separate [egl] that is required to be enabled if you also enable a feature
> that depends on it (such as gles or wayland).

I did this initially and ended with the patch I sent. The reason is
because the EGL is Wayland specific so I see no reason to split it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

