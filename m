Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id BE0FD791A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 05:33:32 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id m13-v6so5056272uaq.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 22:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=iHK2iSTFQqXLT3L2irYUMQsRi2coEAYOMg6Q7re4G48=;
	b=mgggP5eWklnD4lVifV/iuAhjdN1AOWvnP2O82efBOXl5B0vOLhii7ZGdlkQ9y+tGbF
	XjsajfYWp9uK0oDK6RwWYH9Um2M8B/rV7Z5Q5iIrM+PsEB7FnLhHHPAP6xR25C1xdHQg
	QR1suZSTFNXlVpOKRj6WqucS47jafXVXeQCYO40fxlVCEVu8HlPmHZbxix5gs7FeFEpC
	BETCe9FrJTmntbslyR87rFLKLE7YkJcVz6pXIFlaKqnr/XB6nSn9O5CEGfgwXFrBUAjN
	/Eet/TCL9qJqCDUUBylDM7TfSyGKV1H2Wch2gFxEFJT56lssRXrQgDDpLhdwjSWYq2mv
	60/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iHK2iSTFQqXLT3L2irYUMQsRi2coEAYOMg6Q7re4G48=;
	b=gpseYVrLy/4osb/WauFBkb51vLvpGRU6uqTMqV+WE3ltkMplCYk3YUyl00OWflK/4D
	OBD8SbpLIgCmhzxlCA4n/I4VGu8tH9pxMS8ijrRGcigWsbZ8fn+7ptl3KDuiwO+ZYAJR
	4yIznqMRruS6rL35E+9XEtOKLIBYX0kpZLwM2dh+i5vov8E7hFe1c0fR+ZohATap+odm
	TrcygZl15qJj0WQH+W1z5+EdJWmuR+/cvkht6DIjDNE2G89rEM1iNMv7Bh6Bv6uDiyIh
	umBIaf/V95dF5et21occB/EQqutRbGfx+HQF946qJ/UlJ+TnI7sjqnDu2dxmm0Urdiym
	DTNg==
X-Gm-Message-State: AOUpUlEHOCjUrq1MT4qmPQA19tNWip8/HBeaTXM9jUGb3Sdy/UGSN0k+
	Nsxsh156eI4TQ9QxF21XL5MoptUh+ED/anGZT1C2uvOU
X-Google-Smtp-Source: AA+uWPz1c/+A23VynnCaXPtDmKwFlKIZo8JtJR2a0JSAi12TByrdNSqb4BUE7Q4qVJZEM76GYeCXUjWskUvDdE3Fo9w=
X-Received: by 2002:ab0:2687:: with SMTP id
	t7-v6mr22131139uao.195.1534484013528; 
	Thu, 16 Aug 2018 22:33:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Thu, 16 Aug 2018 22:33:33 -0700 (PDT)
In-Reply-To: <b55e3c9e-bcee-7466-5fd5-8f98f7233899@geanix.com>
References: <20180815115907.14045-1-martin@geanix.com>
	<CAJ86T=UJ1xqGDjeO+i9Qyy8sbA_027c2GZQtaqSwp15VAaoUHw@mail.gmail.com>
	<b55e3c9e-bcee-7466-5fd5-8f98f7233899@geanix.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 16 Aug 2018 22:33:33 -0700
Message-ID: <CAJ86T=WJ=YDTjLTONCbDTb6EQOeKT9atKXWwpnazE0LDccgs6Q@mail.gmail.com>
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: fix wrong volatile dir for sshd host keys on read-only rootfs
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
X-List-Received-Date: Fri, 17 Aug 2018 05:33:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2018 at 11:26 PM, Martin Hundeb=C3=B8ll <martin@geanix.com>=
 wrote:
> Hi Andre,
>
> On 15/08/2018 21.47, Andre McCurdy wrote:
>>
>> On Wed, Aug 15, 2018 at 4:59 AM, Martin Hundeb=C3=B8ll <martin@geanix.co=
m>
>> wrote:
>>>
>>> When the read-only-rootfs image feature is enabled, and openssh is
>>> installed into an image, the ssh daemon is reconfigured to use
>>> /var/run/ssh when generating host keys.
>>>
>>> Fix up the creation of the volatile dir to actually match what sshd is
>>> configured to.
>>>
>>> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
>>> ---
>>>   meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-connectivity/openssh/openssh/volatiles.99_ssh=
d
>>> b/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
>>> index a0d2af3c65..fcbc5ae9d5 100644
>>> --- a/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
>>> +++ b/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
>>> @@ -1,2 +1,2 @@
>>> -d root root 0755 /var/run/sshd none
>>> +d root root 0755 /var/run/ssh none
>>
>> This doesn't look right.
>>
>> /var/run/sshd is the directory used for privilege separation (grep for
>> --with-privsep-path ), so it's not correct to remove it.
>
> I see - didn't know about openssh chrooting to do privilege separation.
>
>> Note that sshd_check_keys script runs "mkdir -p $SYSCONFDIR" (ie
>> /var/run/ssh in the read-only rootfs case) at run time before creating
>> any keys.
>
> Yes, it works without the volatile folder; for openssh at least.
>
>> What exactly was the problem that this patch tries to fix?
>
> I am running a custom image with the read-only-rootfs feature enabled, an=
d
> wanted to make the ssh host keys persistent across reboots.

That should be possible by following the steps described in:

  http://git.openembedded.org/openembedded-core/commit/?id=3D106b59d9f96f70=
d133fa1421091ad280d27a5b6a

ie add something like the following to a .bbappend:

  export SYSCONFDIR =3D "/data/ssh"

  do_install_append () {
    sed 's|HostKey /var/run/ssh|HostKey /data/ssh|g' -i
${D}${sysconfdir}/ssh/sshd_config_readonly
  }

The openssh init script has changed a little since then, but I think
the same basic approach should still work (and if it doesn't we should
fix things so it does).

> At first, I tried adding a bind-mount entry to fstab from /data/ssh to
> /var/run/ssh, but the latter don't exist when mountall.sh is executed by =
RC
> (/data is the mountpoint of a persistent partition).
>
> I then looked at the volatile entries and noticed that it created the
> (empty) /var/run/sshd, so changed it to (wrongly) create /var/run/ssh
> instead.
>
> That wasn't enough though, since populate-volatiles.sh comes after
> mountall.sh.
>
> In the end I simply added a new entry to volatiles to create a symlink fr=
om
> /var/run/ssh to /data/ssh, which works for me :)
>
> Maybe I should change the patch to add a comment about the /var/run/sshd
> entry, so we don't end up doing mistakes like the debian-predictable-keys
> story.
>
> // Martin

