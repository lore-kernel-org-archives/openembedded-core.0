Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3EBD56DD15
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 19:58:04 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id id10so8643907vcb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2013 11:58:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=i99No/8uVL1r8cxf6IPkh/tzqoSO4xU+kZMQyGS9XQ0=;
	b=CQNeZxF6B6OcdWIOaWphRQyRZWuUDdX5+0GWh2hHOXV0qDu+D3hz7XLUKjt1oMTCXf
	y6X825yGrrlY0XNKipCx3cov6ITSXqXQruk4f2JjV6rmpmaE1jNAPOH30fGPTxtWFTmg
	9UpM1m/m3edoXH8Qa7MFw3H+UmuE/f2BYdifgE18HEb7ixBwzNJV1k6zrT7uF+qSggoG
	hAsVakx2ZKrRJpascrW8MgUwHCWMci1AUwJ6UQnU+2tO0a4CBY6+OGSP+jRQYVJs6hji
	B6wwn0jwyDqZX+XaHerWYdsn+GiKQeq0ZOhgQot+BQkHGyD4Ygx/X8dFlE0v5Kov7oAV
	8Fcw==
X-Gm-Message-State: ALoCoQna9n/PDUbYOyGJodSqhaCpQopQFDPyGS6jerV9c1Ek5X9J86Pmujw7Vr2ghuNsP1De1Kv9
X-Received: by 10.220.132.194 with SMTP id c2mr100748vct.55.1386014283224;
	Mon, 02 Dec 2013 11:58:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 2 Dec 2013 11:57:43 -0800 (PST)
In-Reply-To: <529CD149.8040206@linux.intel.com>
References: <1385159590-27427-1-git-send-email-sgw@linux.intel.com>
	<CADkTA4OefQPB3r4EjthZoGEnW=4Q1knwm6WgPG7eV9BveVZ21g@mail.gmail.com>
	<529CD149.8040206@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Dec 2013 19:57:43 +0000
Message-ID: <CAJTo0LatgF14Eod5ba2TaZhkONnJW8o7vOgCJLuOdRzsu8UXDg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Extend to support genericx86* machine types
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
X-List-Received-Date: Mon, 02 Dec 2013 19:58:04 -0000
Content-Type: text/plain; charset=UTF-8

On 2 December 2013 18:28, Saul Wold <sgw@linux.intel.com> wrote:
> I believe that this is fairly doable in the x86 space since the compiler
> setup and kernel configurations are almost identical, sound and nfs are
> missing from the generic configuration.
>
> This will also help our CI on the autobuilder since it will drop 2 machines.

This does break the neat layering and symmetry we have, in that
oe-core just supports qemu machines of every architecture we support.
Remember that genericx86 is part of meta-yocto not oe-core.

Ross

