Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id CF11075277
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 23:22:39 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id g9-v6so279459uak.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2018 16:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rZq57KUNsSB4ScDhyHPrfv2G3GFOmx1SwlTSUWkD1w8=;
	b=WhGqpyAlrvOIFbxXbbWLxfJPEhNHd7z67mZFDSB/S5M06s4G/BAiwr7Ql6/9t2prMs
	FzS54HtsXmxyMOXPQF8tRZ7afxZoRqD1E0TaSF/CQDEJXha2a3IMZ54fEgB86b0qycEZ
	cg0tHqXAsz1MCqbePWbI3X/4oY/Uo3uuiVBYHEmTKdnue4nps1dzRxdzGBwxJRfCvfRZ
	OfVFGGYdmHW0PoX/tX3/zSVeRfTAuq0qk8rAVPfafuXitiQtMOgiWHVuWQ/yU0JuVfdj
	UCdY7yBGzyRwcUkOpCvriE7ptGhzx7t3fmJRSHdyV6oN4DTSiUIw3tjF6zF22Wv3lcUK
	4eMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rZq57KUNsSB4ScDhyHPrfv2G3GFOmx1SwlTSUWkD1w8=;
	b=TfGVr3lLh3EPqdT9CFbQD5RgujGtYU0GcIXyKEdVbZ3IcnSPCYbuYHC6kRlqXbCJw3
	1RpD0FHuZmqLEr8isTk89FKDtUjOM8TajYJOd1QJGIa2InTdN8f0EtRzA4U9kpZ703P0
	hVIRHEr28bb6jU2Y2M5hU92huJ5eTiF1VHYtUuSjd+UgklvvPtXJOwY1Am6dSpUUSF/J
	4x8z/e1EZ/72ZOaMnXjbz+lgZ9gMUjfvwLJl1f5wFBaRYENad+kwG0la73JyOPjI0Ed0
	fr93/0ttZmN7OUvD0ESulHC3qX7O4V2FGmqzqlpgNoZteC6IzgnkQJckoA91SqqEtYGO
	8k1g==
X-Gm-Message-State: ALKqPwdPaw5gXJ7ax2vGjlP0suWWNi3Q/mrsQB5RpAIkW1JZkvn15Qbx
	udliTzgrwXJ5UaHnu35pQx6fXBPGWvRJrti3Fp8=
X-Google-Smtp-Source: ADUXVKKaOQ9w3qWqT8wqTzMgoFCTEGIx8/nQONiak166a14TLabFJIu8Oux9+JiHxutRoKDHSgwp/w2JApJsxdFZ7Ow=
X-Received: by 2002:a9f:3352:: with SMTP id
	a18-v6mr15337556uac.38.1528154560610; 
	Mon, 04 Jun 2018 16:22:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 16:22:40 -0700 (PDT)
In-Reply-To: <42d1ff74-c9d2-de23-a92d-dfa0eee736af@windriver.com>
References: <1527286040-11947-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=VFe=vuPfudEY_hUV3MMz34vOak7stiTHR33nTmya68Cg@mail.gmail.com>
	<42d1ff74-c9d2-de23-a92d-dfa0eee736af@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 4 Jun 2018 16:22:40 -0700
Message-ID: <CAJ86T=XxoiCLw3xXz-kkvZbDVnWqpjazWPW9b7pf8h3o7o2nJQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: drop sshd support for DSA host keys
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
X-List-Received-Date: Mon, 04 Jun 2018 23:22:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 4, 2018 at 3:25 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 6/4/18 2:18 PM, Andre McCurdy wrote:
>> On Fri, May 25, 2018 at 3:07 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> DSA keys have been deprecated for some time:
>>>
>>>   https://www.gentoo.org/support/news-items/2015-08-13-openssh-weak-keys.html
>>
>> Ping.
>>
>> Any issues with this?
>
> At Wind River we have a series of patches to disable weak-ciphers.  We had
> globally disabled them a while back and found that a number of applications and
> customers still were using them for various things.
>
> Even though they were 'weak', they were still needed.
>
> See:
>
> https://github.com/WindRiver-OpenSourceLabs/wrlinux/tree/master-wr/wrlinux-distro/recipes-weak-ciphers

Disabling weak ciphers in openssl and then fixing the fallout in
*everything* that links with openssl is quite a different and more
ambitious undertaking.

For ssh host key formats, the only requirement is that host and client
agree on at least one common format. RSA is the most common and well
established so as long as we don't disable that, disabling support for
less common or less secure formats is unlikely to cause any issues.

Currently for the dropbear ssh server we ONLY enable RSA host keys and
that seems to be working out fine.

Having our openssh server drop support for DSA host keys seems like
the right thing to do given potential security concerns and the fact
that modern ssh clients (e.g. openssh after 7.0p1 from 2015) don't
support them any more.

> If this work is something that should be submitted to oe-core/meta-openembedded
> and would be a candidate for merging, I'm all for it.
>
> My suggestion though would be to reverse the checks we have.. instead of a
> distro feature of 'openssl-no-weak-ciphers', make it 'allow-weak-ciphers', and
> disable them by default.
>
> A few things like Kerberos, freeradius and others require weak ciphers for some
> functions.  So the corresponding patches for those would need to be developed.
>
> If this is something we want to do, then the OpenSSH change below could be
> switched into a PACKAGECONFIG option, and still allow people to define an
> insecure system -- if they need to...
>
> --Mark
>
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>  meta/recipes-connectivity/openssh/openssh/sshd_check_keys | 8 --------
>>>  meta/recipes-connectivity/openssh/openssh/sshd_config     | 1 -
>>>  meta/recipes-connectivity/openssh/openssh_7.6p1.bb        | 1 -
>>>  3 files changed, 10 deletions(-)
>>>
>>> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
>>> index 5463b1a..be2e2ec 100644
>>> --- a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
>>> +++ b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
>>> @@ -60,9 +60,6 @@ done
>>>  HOST_KEY_RSA=$(grep ^HostKey "${sshd_config}" | grep _rsa_ | tail -1 | awk ' { print $2 } ')
>>>  [ -z "${HOST_KEY_RSA}" ] && HOST_KEY_RSA=$(grep HostKey "${sshd_config}" | grep _rsa_ | tail -1 | awk ' { print $2 } ')
>>>  [ -z "${HOST_KEY_RSA}" ] && HOST_KEY_RSA=$SYSCONFDIR/ssh_host_rsa_key
>>> -HOST_KEY_DSA=$(grep ^HostKey "${sshd_config}" | grep _dsa_ | tail -1 | awk ' { print $2 } ')
>>> -[ -z "${HOST_KEY_DSA}" ] && HOST_KEY_DSA=$(grep HostKey "${sshd_config}" | grep _dsa_ | tail -1 | awk ' { print $2 } ')
>>> -[ -z "${HOST_KEY_DSA}" ] && HOST_KEY_DSA=$SYSCONFDIR/ssh_host_dsa_key
>>>  HOST_KEY_ECDSA=$(grep ^HostKey "${sshd_config}" | grep _ecdsa_ | tail -1 | awk ' { print $2 } ')
>>>  [ -z "${HOST_KEY_ECDSA}" ] && HOST_KEY_ECDSA=$(grep HostKey "${sshd_config}" | grep _ecdsa_ | tail -1 | awk ' { print $2 } ')
>>>  [ -z "${HOST_KEY_ECDSA}" ] && HOST_KEY_ECDSA=$SYSCONFDIR/ssh_host_ecdsa_key
>>> @@ -79,12 +76,7 @@ if [ ! -f $HOST_KEY_ECDSA ]; then
>>>      echo "  generating ssh ECDSA key..."
>>>      generate_key $HOST_KEY_ECDSA ecdsa
>>>  fi
>>> -if [ ! -f $HOST_KEY_DSA ]; then
>>> -    echo "  generating ssh DSA key..."
>>> -    generate_key $HOST_KEY_DSA dsa
>>> -fi
>>>  if [ ! -f $HOST_KEY_ED25519 ]; then
>>>      echo "  generating ssh ED25519 key..."
>>>      generate_key $HOST_KEY_ED25519 ed25519
>>>  fi
>>> -
>>> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_config b/meta/recipes-connectivity/openssh/openssh/sshd_config
>>> index 31fe5d9..b7c3ccd 100644
>>> --- a/meta/recipes-connectivity/openssh/openssh/sshd_config
>>> +++ b/meta/recipes-connectivity/openssh/openssh/sshd_config
>>> @@ -22,7 +22,6 @@ Protocol 2
>>>  #HostKey /etc/ssh/ssh_host_key
>>>  # HostKeys for protocol version 2
>>>  #HostKey /etc/ssh/ssh_host_rsa_key
>>> -#HostKey /etc/ssh/ssh_host_dsa_key
>>>  #HostKey /etc/ssh/ssh_host_ecdsa_key
>>>  #HostKey /etc/ssh/ssh_host_ed25519_key
>>>
>>> diff --git a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
>>> index e11e8d7..a527a7c 100644
>>> --- a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
>>> +++ b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
>>> @@ -110,7 +110,6 @@ do_install_append () {
>>>         install -m 644 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/sshd_config_readonly
>>>         sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
>>>         echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
>>> -       echo "HostKey /var/run/ssh/ssh_host_dsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
>>>         echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
>>>         echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
>>>
>>> --
>>> 1.9.1
>>>
>

