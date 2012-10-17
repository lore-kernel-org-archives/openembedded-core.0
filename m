Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TOVd4-0004Vy-Tw
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 17:33:55 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so11895480ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 08:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6l5uazb4de7Gb5RmmPB6XZOd28aaMrRoHNH+yDIKREo=;
	b=k8q6eOfCPDgX/D7GlxTH/nX7zTbDyBH6IClcP0MYJJ5NrbVt8Jz8LggHE9/BQqCpYZ
	TLqDI12WnVXS62U6Qvy+VteMtaB3KJuejhM+kgBlwsgjh8AvEobs7t1+rkSM2Kw4fl60
	DdpiX+9hJUlXXZhq0Q5KU40oz5SU29Hj9ZxN9TPmL/V/cknnIbTIgDyFOS0JNMpNChLq
	Rfdl11hlwzlqsimnANA7suy8ngAihq/D7i0jl/qa1ksEmo8u4Z8njec4TlYX5N57/J94
	kYheExEC6IgImb6RxKPfocpgl4BzKPRYgxZoVi/OBpCY6854wamOqeInDaRVXpNfJ987
	YrGQ==
MIME-Version: 1.0
Received: by 10.50.36.133 with SMTP id q5mr1934058igj.14.1350487233149; Wed,
	17 Oct 2012 08:20:33 -0700 (PDT)
Received: by 10.64.24.179 with HTTP; Wed, 17 Oct 2012 08:20:33 -0700 (PDT)
In-Reply-To: <CAJTo0LYzc2NMN2Tu4ecT-BYfG9LjAy-AevUx2YBsaVS=85NgyQ@mail.gmail.com>
References: <1350484172-9188-1-git-send-email-s.stirtzel@googlemail.com>
	<1350484172-9188-3-git-send-email-s.stirtzel@googlemail.com>
	<CAJTo0LYzc2NMN2Tu4ecT-BYfG9LjAy-AevUx2YBsaVS=85NgyQ@mail.gmail.com>
Date: Wed, 17 Oct 2012 17:20:33 +0200
Message-ID: <CAGiJk9e0niLAugOkHnVThzmdLZxkenOnj4fboRM9Mt_zUctTTw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] matchbox-keyboard: Use gtk-immodules-cache.bbclass
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
X-List-Received-Date: Wed, 17 Oct 2012 15:33:55 -0000
Content-Type: text/plain; charset=UTF-8

2012/10/17 Burton, Ross <ross.burton@intel.com>:
> On 17 October 2012 15:29, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
>> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
>> ---
>>  .../matchbox-keyboard/matchbox-keyboard_git.bb     |   21 ++++----------------
>>  1 file changed, 4 insertions(+), 17 deletions(-)
>
> Missing PR bump, but acked once that is fixed.
>
> Ross

Thought that the PR bump is needed if the functionality changes?
Anyway v2 coming soon.


-- 
Regards
Samuel


