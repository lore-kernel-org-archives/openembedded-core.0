Received: from mail-ve0-f174.google.com ([209.85.128.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Ubuy1-0004ZH-7n
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 17:47:13 +0200
Received: by mail-ve0-f174.google.com with SMTP id db10so102119veb.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 08:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=4elX/PLlswAKy/oG09InuwgNi1B3E8m8U3C6jpNoVG0=;
	b=DBA1Zezrj/nb9LW0foSNrGhkJVMczJ3MGT/s9Gb7zG80nFpAt8yqjQ5MXmZrvxYTzN
	ELany3NKZ52kOQEOpkVu6+2cQElNzbiWbidgt+moJUg+5+1HOETuglPoIxecMBUG3EZR
	xjTZ7hoKDD2R7rL3reLsPj6GGXyx5Q5ZxFNEFTjbHWHdzh/yN//IkJpTfrI1q/oNQEYn
	qFPCS1sOikdkhI2GkyWi48YiR2KtFpmqBLSiH4OcfbqlW5xDDY+e7SfsOCC00q2X1+6D
	kQUcUkrdfvcD9kFnqKgTEySmR1HsbjaO5kD+ZuPQh5JcXobbTKkxrvitK+Y0YhpcLuAy
	86tA==
X-Received: by 10.220.176.71 with SMTP id bd7mr18579019vcb.12.1368458941962;
	Mon, 13 May 2013 08:29:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Mon, 13 May 2013 08:28:41 -0700 (PDT)
In-Reply-To: <CAP9ODKrOs_bqf0g5Aw3WhJ3ZVoNM2aqMCoQzWZ+8e9LX7cwscg@mail.gmail.com>
References: <cover.1366963971.git.liezhi.yang@windriver.com>
	<4aa663aaedff33870a96a676b9394ff79fe49eac.1366963971.git.liezhi.yang@windriver.com>
	<CAJTo0LbU2=iEOpnw3GRSntQQyH73RaJ++zdzye2s1zvsgEznSQ@mail.gmail.com>
	<517B30A4.5050405@windriver.com>
	<CAJTo0LYzafv3Eb3QtbVT+jbRkfPN2_vUxh0bsS0WZ9bJc8-NaQ@mail.gmail.com>
	<CAP9ODKrOs_bqf0g5Aw3WhJ3ZVoNM2aqMCoQzWZ+8e9LX7cwscg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 May 2013 16:28:41 +0100
Message-ID: <CAJTo0La+3k4HPZzXuV8gqKUSGhk3+=jHXnpa516Ge7KSAi9waA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQl7wc2IXKbT66YOtJe6mL1tI6VK63akbl9jNAsMoiePUimTFXo49GzHfnzwWkms2F46D1J0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] glib-2.0-native: do_compile failed on opensuse 12.2 64bit
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
X-List-Received-Date: Mon, 13 May 2013 15:47:16 -0000
Content-Type: text/plain; charset=UTF-8

On 13 May 2013 16:23, Otavio Salvador <otavio@ossystems.com.br> wrote:
> We may need to have a mechanism to specific build dependencies for
> native depending on host version/distribution.

The situation is that Suse splits the expat parser into a separate
package for some reason, so the "fix" is to actually install the whole
Python core library by installing python-xml if it isn't already
pulled in.  We could add a sanity test that the python available is a
full python and not missing the expat parser (suse without python-xml)
or isn't python-minimal (ubuntu).

Ross


