Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4C3686010B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 11:14:07 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id t5so29141696otk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 03:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YImpBY5Ksxnf7Aqp7EGjA/mFpQLwqYPkTcJweE8TIdg=;
	b=vZqMAumaBEvyq3SwYj7AU9DwIvzz95MW/FusryZONVxX/+6iK0mHI4B34v/XzHHt3F
	Yd//nfEGUA7oAZJdStT9Rrc653SqTEY5cQzC991jb+f6wUqZ1P3WP2UjQNoBoAl9Nl2l
	3qI3xxw8UgFSxlaAfUV1JkIiLITqWfD32THSFodDR89RAzc2yT9ZapK8ALfLuIPiI+G5
	kL63CkHrGPYvu9vhwvuuSuY0MwP6xANmWR4jtn3jP+HtTmdKdgXitEhUNDTf7JQX4d9E
	WzxOZJTy1JDa3XoABLzCPBTXgj331DBvPGFNmD5EQqriz8y6QwXjCa24mNnPHlewOzgr
	eygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YImpBY5Ksxnf7Aqp7EGjA/mFpQLwqYPkTcJweE8TIdg=;
	b=lR78xFwJMFrXIn0EKwMhi0gq22rNjwy51bEmNuGZxqo6ALDAU8cQD0S3wnPL7EHRmn
	TSpGTwKu03mHDf23iyoB9iTCfZYjL8EDKou2Qc3xcsogcp4BnHlo2jB0f2hqQ2rdT9Ps
	ZcyCH0zEvbxD3CqmR4hgkJCkHduYDFhTWL2dztOOSaHowB1yOxBtLg+KwtSxDQ8Hfsx5
	ReWmrLSpa3SWUVuwc/9IIyyy6uYC8Q4qR5HvA0o2dz6C0Ms2FO1u3/ZLvbDUkz6qNg6V
	GEY6djntgcrR+CxfvQ4BnSOFVpcqMKgu9CpfGiv+eOiJms2k5rdbkeh2hLmAYqx2NNfd
	oh+A==
X-Gm-Message-State: AJcUukerJWzjyHQljEF1bvm1xz4U5wDvK14Tzgi4oDSQyU+8Gk8WumtN
	1obhyerkmE1KJ8D7Xp4kPJ11odiACy92f2ent522aQ==
X-Google-Smtp-Source: ALg8bN6kKyqm6DOlUfmWfAFOr3BsnAr9LbPuwQaSrWgGWXBrYrMY56c88di2rwhgQjowqNScZJbH3JhL8KkueD6fh+s=
X-Received: by 2002:a9d:5cc2:: with SMTP id r2mr33051147oti.367.1546514048350; 
	Thu, 03 Jan 2019 03:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20181218163005.1330-1-alex.kanavin@gmail.com>
	<20181218163005.1330-4-alex.kanavin@gmail.com>
	<a5b9f3c5-7ed2-ceb9-70aa-8ea5ec7b86c9@windriver.com>
In-Reply-To: <a5b9f3c5-7ed2-ceb9-70aa-8ea5ec7b86c9@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Jan 2019 12:13:57 +0100
Message-ID: <CANNYZj9JJS861wGE5URysk2m4CGQDnGZZ5Y681rmuwjzpDU7wA@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/13] libdazzle: fix a build issue with meson 0.49.0
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
X-List-Received-Date: Thu, 03 Jan 2019 11:14:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jan 2019 at 09:49, Kang Kai <Kai.Kang@windriver.com> wrote:
> The first error has been fixed in gobject-introspection 1.58.2. But I
> didn't find out the root cause of "qemu: uncaught target signal 11
> (Segmentation fault) - core dumped".

Same issue here - and it used to work for me :( Unfortunately I don't
really know how to debug this - typically we just add arch-specific
configuration flags that disable introspection.
However, the crash may mean that libdazzle won't work on target mips
hardware either.

Alex

