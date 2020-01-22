Return-Path: <ml16685@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id E43A67FCB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 12:43:29 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id a5so6685901wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 04:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=CtvQv95DL+cD9AsE5iuyFKapr+KoKfDiWDaFbZfGXAY=;
	b=FUQB3qFX1BcQTgkA+55mS36wt2RqWuE/yUKu/HlY0/NSm/CLaSCCcJqkabKHRf9B40
	5DpYThMg/AWdqic29sJq1FXgdjxaI3+p6JI3K2W23345yMCseFjEHWqf1H30bJ20sAip
	LPpRywwkpF3iGzFJZcz7bq8viykyp4r/ElG+SIQtoW4b0+1X7qP77eMwEVs+WA43mVCx
	n0rAguMT9uFRjaS1KyLYTjPwF35j83EP41H/uUxQnZKN52wIOoUOJXZQTDoT6FpHWOFU
	r+aS2EPz07jiAG7YZFtQ1pNjSNqJut0JEg4cIBqitfYhnZ2Hum5QHdAR172rBr2lHUvx
	zzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=CtvQv95DL+cD9AsE5iuyFKapr+KoKfDiWDaFbZfGXAY=;
	b=ptA0Oj/a7Ni7FCqnxhe4fHH3wj5g4KNUzsLVq31nsVjo6X+OF+4enqFweeMvOXgmLX
	IJwUsr17Rfy6wz2XhRLf/3H7BZL1jhUlmZ+xPREPyVBAroDwil0b2BHctyaW7cpFDyJ3
	8dYWC1qNk+ntOPkeFRK3zVUBjh9qh+4TqK1oALcWdfxl5Q2FumXGnEeSrGsZ496+G3HG
	i+2K8IxSJC+20UBDny5klXxT9PnIQNGtiTmowDiJZBqlbwpAlTO3/k0CvldBtXnEppjY
	Utd27nYqD0KKBygRAujVV6p8V0Yq4w5DeUoPz7YSE3A0O/mCPxYt4XCb9xpJPonGH5g0
	M39A==
X-Gm-Message-State: APjAAAWhKFswyQzAwtSHka7KP1xGoRTojnRTD4rPlM6SxSAe8BqfD0eb
	OxJdMrN8t/IsclzSVBv0FUhvp+TB69bdTrzGztTTrpHn
X-Google-Smtp-Source: APXvYqzKHQoNrve+bNiytrXMD39M2x5Aep/lyR6nwPig8/boo31zkZwvr/2P4x70SN6lgCdM4S9T5vmJZvD2Z0f80r4=
X-Received: by 2002:a05:600c:295a:: with SMTP id
	n26mr2871717wmd.187.1579697010309; 
	Wed, 22 Jan 2020 04:43:30 -0800 (PST)
MIME-Version: 1.0
From: Maxim Loschilov <ml16685@gmail.com>
Date: Wed, 22 Jan 2020 15:42:54 +0300
Message-ID: <CA+Hf7OPtXQFg=L-1dbd7FmY5u_t2TyUWRDgWFA0tage4SsJ77w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Excluding test folders from python install path
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
X-List-Received-Date: Wed, 22 Jan 2020 12:43:30 -0000
Content-Type: multipart/alternative; boundary="0000000000002700dc059cb9df8a"

--0000000000002700dc059cb9df8a
Content-Type: text/plain; charset="UTF-8"

Hello,

When preparing an image for device I'd like to exclude test folders from
python install path, i.e. folders like:

/usr/lib/python2.7/test
/usr/lib/python2.7/sqlite3/test
...

They take much space and are not needed on my device.

Could you please advice is there a configure option for python recipe to
exclude these folders?
Or maybe some other python recipe modification?

Thanks in advance,
Maxim

--0000000000002700dc059cb9df8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>When preparing an ima=
ge for device I&#39;d like to exclude test folders from</div><div>python in=
stall path, i.e. folders like:<br></div><div><br></div><div>/usr/lib/python=
2.7/test</div><div>
/usr/lib/python2.7/sqlite3/test

</div><div>...</div><div><br></div><div>They take much space and are not ne=
eded on my device.</div><div><br></div><div>Could you please advice is ther=
e a configure option for python recipe to exclude these folders?<br></div><=
div>Or maybe some other python recipe modification?</div><div><br></div><di=
v>Thanks in advance,</div><div>Maxim <br></div></div>

--0000000000002700dc059cb9df8a--
