Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RH1Mq-000394-Qc
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 00:45:41 +0200
Received: by ywf9 with SMTP id 9so840571ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 15:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=ztAC7tjmgCwOdHcP+DeIjysS5WjMC8dpH1slOlvl4FU=;
	b=ZVpZebm9PR36dKQXeeQydqS6DiW3xSwv2Ny/hAjmxYxVc/gQznGqlMiAgGUBQz8kq8
	7I+xoowt22eBhdErH3xTXHBjCH7WnOGbYglnhtuHMVzrMCMN78lmkCdAI7RshytDLS8+
	nWAUdEQ/nhm913olhnbkiTYQmjYaCrQLAobvY=
Received: by 10.68.71.234 with SMTP id y10mr22713130pbu.132.1319150384099;
	Thu, 20 Oct 2011 15:39:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 20 Oct 2011 15:39:13 -0700 (PDT)
In-Reply-To: <20111020194453.GL3522@jama.jama.net>
References: <cover.1319139126.git.raj.khem@gmail.com>
	<15763124703d12326c8ba4d296a2b2680528c2da.1319139126.git.raj.khem@gmail.com>
	<20111020194453.GL3522@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Oct 2011 15:39:13 -0700
Message-ID: <CAMKF1srSUBj+faDjMuvALK6=Jr+SXv38h0DyoaL3Lva0jrXfPQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] xserver-xorg: Add mesa-dri to DEPENDS
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
X-List-Received-Date: Thu, 20 Oct 2011 22:45:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 12:44 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Thu, Oct 20, 2011 at 12:36:01PM -0700, Khem Raj wrote:
>> Fixes the compile problems e.g.
>>
>> | checking for GL... yes
>> | checking for DRIPROTO... yes
>> | checking for DRI... no
>> | configure: error: Package requirements (glproto >=3D 1.4.14 dri >=3D
>> 7.8.0) were not met:
>> |
>> | No package 'dri' found
>> |
>> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
>> | installed software in a non-standard prefix.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0.../xorg-xserver/xserver-xorg_1.11.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
>> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb b=
/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
>> index 0f94fe2..2aa71e5 100644
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
>> @@ -1,2 +1,3 @@
>> =C2=A0require xserver-xorg.inc
>> =C2=A0require xserver-xorg-${PV}.inc
>> +DEPENDS +=3D "mesa-dri"
>
> You can do this in xserver-xorg.inc
> just change
> LIB_DEPS +=3D "virtual/libgl" to
> LIB_DEPS +=3D "mesa-dri"

thanks. I have updates the patch accordingly in the pull request.


