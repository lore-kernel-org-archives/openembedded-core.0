Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 45FA56E00C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 13:47:33 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id a41so7530274yho.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 06:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=LzD2rvzZwwjSUVQIVnNLcGKin1rum37qcRAt7Hqjq5Q=;
	b=g3F7+R5EehW69Wt8cyD4tJZXLwOx0h6iek5IMsnzSqof3miPMgE1IKLJLChQbyY1Tc
	AaxilQLp75aH9ju2XkZJLfAjjTkTS+2G/mRrthe8EYolMUCtPtpz+577ohQNtbURuC2X
	WVuGe7IdoaIypaXtmxW1kwkA9bmLfM/WKR2Xbt/O55eTmUo2+htfzz+UD4aYOHjk6qPZ
	mOLMuOx9AkND05pxMFhENAXmHvmQwjNKbFO1Jn+9vj+J3NSHQK/IKuAZjcNPx2ldO/Xh
	L7OVk2xiI2KOT5jvE21Dj1vhwLFU0LCs6WsuG6XeLwtu4iaf+JKrdw9QgGcCXI1X1TrQ
	rflQ==
MIME-Version: 1.0
X-Received: by 10.236.198.243 with SMTP id v79mr4392483yhn.87.1396273654673;
	Mon, 31 Mar 2014 06:47:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Mon, 31 Mar 2014 06:47:34 -0700 (PDT)
In-Reply-To: <CAJTo0LbBHoO-_M=C7rc8FPjfzeOQxM2PAXjXbenBXxCwGW2oGw@mail.gmail.com>
References: <1396123481-6064-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LbBHoO-_M=C7rc8FPjfzeOQxM2PAXjXbenBXxCwGW2oGw@mail.gmail.com>
Date: Mon, 31 Mar 2014 10:47:34 -0300
X-Google-Sender-Auth: XIL_4VIoC-ZOj-ofy4mCc71KDok
Message-ID: <CAP9ODKo3P_KvAYhbOs0VdHS_yQJ5Dk0EjhZ-vC387vAJ9XBonw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] packagegroup-core-tools-testapps: Move GLTOOLS to X11GLTOOLS
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
X-List-Received-Date: Mon, 31 Mar 2014 13:47:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 31, 2014 at 7:14 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 29 March 2014 20:04, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> piglit and mesa-demos are not buildable in x11-less distros so we must
>> to add those only when opengl and x11 DISTRO_FEATURES are available.
>
> I'm surprised that piglit needs libx11, waffle should be abstracting
> that.  I'll have a quick look.

Could we merge this and then fix piglit? I will send v2 as suggested
by Richard, so we can address this.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

