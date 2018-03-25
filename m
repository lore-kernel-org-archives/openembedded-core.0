Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA4E6FEFA;
	Sun, 25 Mar 2018 15:23:40 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id l4-v6so20279387lfg.12;
	Sun, 25 Mar 2018 08:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tNDQo6SJ5vDvCnWqKHSmQrFNHC5gQtnijhQ9nDLjCeo=;
	b=l1kSupmxiLkUDvqJBElFvFk4DSp20EYx0rEBYkhNhBu4d9hZsoPS8UCZs9CZ3H+1TH
	LtAoUYRYBCgWtMiOGl1SUSq96fQoKBe/fzeCnbje4SiXNWVOZFtRK+iM5SPeUlchLWYP
	4SQrh1NVjZ9g0vuxB37/NDJQiVBf5mipr+wKaqWakYz7eJFbKIDXbUPdmWp1TQTGKtef
	4Kk9VnUk740KWDpQj/qx6mWKhrdxmMxNsi9Z21h4wLMrFUcI+hEHg6T6ruqGck3LUi8r
	DSMechvVuZau0DOVXCEdw0UfYn9LUu0aB8nYvxtCRxr/Mekqtqisj2pdKIsPrXcBxQFw
	T9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tNDQo6SJ5vDvCnWqKHSmQrFNHC5gQtnijhQ9nDLjCeo=;
	b=MTuOKQ4EMpDpzEyTf3Ax322axzHBqM/oIBkda3H0g+Ek9vGhPrMCNjczn+5o1azkkV
	17xK+FPYGI/ZZXuil/wgCmbureU5c493I5d6O8G/ypEYj7QDas1x4u4keUOXTjtKT9NT
	f+Pu4LImqllSnX5NXJH7yb4XmCGc9ZJV5iv1JU2OL0iHaAi+NUM8z6OANX9MVFmI7NC0
	27vwQTV7yof07eZGfPPxaom6DnNa5rXwiqFretd+8q+Oba95mLdyX2RUTIkJUGUR4T0d
	bPIGqmCkWDjq//QuS0YiCBIN+tJ5KUzG7vt3znfeWNhVx+N7WWn5kSENUxB0frP5SzNt
	ihtQ==
X-Gm-Message-State: AElRT7GSGrp+Jx8G4TrinRUnZ/NVOqlnmc6T9U577zSK4xNGvas20RPw
	iUyHo2sp/4AyDDCRGsFW5xIRwXpLajTr7NMWgU8=
X-Google-Smtp-Source: AG47ELv9zzlLlriEG5KTW9iHvYLYkQtrAx3SFYVDA5oaYgfj3JU33dfeVK96gIgmsb0+nQuxhXjMXNcvdtFCOVpcYfk=
X-Received: by 10.46.16.85 with SMTP id j82mr21958431lje.139.1521991421047;
	Sun, 25 Mar 2018 08:23:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:d80f:0:0:0:0:0 with HTTP; Sun, 25 Mar 2018 08:23:40
	-0700 (PDT)
In-Reply-To: <9a608e4c-0752-eeb2-306c-f8804c584be2@gmail.com>
References: <9a608e4c-0752-eeb2-306c-f8804c584be2@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sun, 25 Mar 2018 11:23:40 -0400
Message-ID: <CAHUNapSXZk0Ocmc9xeG2NAcVioF=5xjpzSxMXVxa9hAcGDKLZA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: X11 proto changes
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
X-List-Received-Date: Sun, 25 Mar 2018 15:23:40 -0000
Content-Type: multipart/alternative; boundary="94eb2c1a5ed000bd2b05683e3e74"

--94eb2c1a5ed000bd2b05683e3e74
Content-Type: text/plain; charset="UTF-8"

Have the Xorg developers provided any sort of timeline for this switch?

--94eb2c1a5ed000bd2b05683e3e74
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Have the Xorg developers provided any sort of timeline for this switch?<br></div>

--94eb2c1a5ed000bd2b05683e3e74--
