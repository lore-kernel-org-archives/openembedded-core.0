Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TRnpA-0003kj-E3
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 19:36:00 +0200
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 26 Oct 2012 10:22:00 -0700
Received: by mail-oa0-f69.google.com with SMTP id j6so9336138oag.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2012 10:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=JKh9BAQYI8WMIWZw8mefiSSjPjXqhZOvcVAJpvPH+Nk=;
	b=i9+Al5JaKSxjNnTbN4AB/N0dDxjn2I/rTJ69xGr67wZwT04iCGBqZ6mXUKKUMMSuEN
	jg2Uo0HZdwYl/xr1tAqOsMN7P7haYXZ6Ih6Sp02Z/R0ZnONpY6muMArcqgQsmG6oeLui
	8M70I6n5iDUxny9NIYYSNXCGztcnZCOjinje1OOexiHveP1mmmZn/I/XfOHyOzDI4w8E
	fYz/Iys79wdnUG2c0C4Dx8SHqhYAfeVAqWICzN/b0SzN+VGGVYtkYfAhUr9791irqdq9
	n8uDA5neWD6UBFDG33bvU0Uw7LGzxsQb/gfCFWsuVwSus1l66y8b3wYIr2tutkgAfoCD
	+UfA==
Received: by 10.182.117.74 with SMTP id kc10mr18925933obb.63.1351272146655;
	Fri, 26 Oct 2012 10:22:26 -0700 (PDT)
Received: by 10.182.117.74 with SMTP id kc10mr18925929obb.63.1351272146581;
	Fri, 26 Oct 2012 10:22:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Fri, 26 Oct 2012 10:22:06 -0700 (PDT)
In-Reply-To: <508AB9D5.1030902@linux.intel.com>
References: <1351022257-15219-1-git-send-email-ross.burton@intel.com>
	<508AB9D5.1030902@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Oct 2012 18:22:06 +0100
Message-ID: <CAJTo0LbDAuE59KdzpYNrjjCwuYMi7Eo8YDCS6FgY=T8KUNkq5w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmN7XiP5CO3DfOs68DNY/YuH0FCjzP3ATbDcfP9gAmd8F4yMz9485Iripdb0QSeTTmkiuUOxqY//DxwVrYLAh1C/2a7HkF7LTO0JNVfbhNRqTaqLbCFt3uA/Vuf9gYzOzL4L5GiuNZAoWzYI05OmgA+3l0Woh0ljGjuskqVigeEkjaiYfZxUSAB7yKyFWB9q+L0ql8b
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libxkbcommon: new window system-independent XKB library
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2012 17:36:00 -0000
Content-Type: text/plain; charset=UTF-8

On 26 October 2012 17:27, Saul Wold <sgw@linux.intel.com> wrote:
> My prior email about this being merged was wrong!!

Really?

$ git show 3cabe899c11c65c7a1853b0d2b6fe459098dd4af
commit 3cabe899c11c65c7a1853b0d2b6fe459098dd4af
Author: Ross Burton <ross.burton@intel.com>
Date:   Tue Oct 23 20:57:37 2012 +0100

    libxkbcommon: new window system-independent XKB library

    Used by Wayland, Clutter, and more.

    (From OE-Core rev: 2e4b2d2b8d6f2aeb37654f305bcf6c1c2ffc04f9)

    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Saul Wold <sgw@linux.intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb
b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0
new file mode 100644
index 0000000..7304080
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb
...

> Maybe your missing the require xorg-lib-common.inc?

Nope - it's only vaguely a xorg-lib and there's a good argument to
move it up directly into recipes-graphics.

>> +DEPENDS = "util-macros flex-native bison-native"
>> +
>
> You have a different DEPENDS set than the git version.

Yes, the release has fewer dependencies.

> Should there be a libxkbcommon.inc that's shared between the git and
> "version" bb files for the generic header / license stuff?

Ah. Ignore the git version, that's been succeeded by the release packaging.

Ross


