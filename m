Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RprPe-0002Ua-HM
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 02:12:36 +0100
Received: by lags15 with SMTP id s15so2709836lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 17:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=YkiBYJ6bJOcZ4vyWlEK4XpNQ0Gk8e0QcPW8KBkTVrBM=;
	b=vsRsKLwLC0jNxDIZmDDGiSbEzgkaDDbZVdMwlhYsfRJV5FIlBkJw4Z05HJhEHK4yHL
	l+XnONPeP6ZQnwPUgHh+JeMysedb7KQGXV2S9jWO7ZYg4pnAUYuOY6iYnrJe/Cq2GEqW
	NrthXeFQqTn1YK0T3L3Zm1HWxwrZ8PNWvMnIk=
Received: by 10.152.112.41 with SMTP id in9mr7652743lab.27.1327453488474; Tue,
	24 Jan 2012 17:04:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 24 Jan 2012 17:04:17 -0800 (PST)
In-Reply-To: <4F1F45F0.208@linux.intel.com>
References: <cover.1327447344.git.josh@linux.intel.com>
	<f7bd8523525f541676e8b2e416a4960b45cd7d7e.1327447344.git.josh@linux.intel.com>
	<CAMKF1sq=xpgO=4Ne0YQdkhqXhh_+VcpA2Xyx_Cm3xccUcv3d2A@mail.gmail.com>
	<4F1F45F0.208@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Jan 2012 17:04:17 -0800
Message-ID: <CAMKF1sp+TWp_PneKg7P52GrytWqhcoyV+4=XU_=xk==jGQ9v3g@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] linux-tools: don't build perf when GPLv3 in INCOMPATIBLE_LICENSE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jan 2012 01:12:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2012 at 3:59 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
>
> The issue is timing and resources to do this work, it a larger task that =
may
> take more than a few days to refactor perf into it's own recipe and share
> the source area (ala work-shared/gcc). =C2=A0We need to get the non-GPLv3=
 build
> working again and this seems like the most direct route to accomplish tha=
t.

is that a blocker for oe-core ?


