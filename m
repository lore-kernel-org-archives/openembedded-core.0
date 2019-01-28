Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
	[209.85.210.54])
	by mail.openembedded.org (Postfix) with ESMTP id DEB3F7C5AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 17:38:04 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id 32so15320275ota.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 09:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0zhR5re1kUpsmkm9xtnAb/mAVfGZITz158tABkGImVk=;
	b=LCowzomuW6wlSUT67oUba+vTLR4Qqk8Zj78wKEXCEnuDLzMJPzdjIvhq4nbPiiEPKf
	hyvagUTAq5KkyuamJ8c/wqnt33jaKCbwLHQ1/yKfDcDbiijmkJNlUkaOK+GImReu+Fgl
	iUewR3JNUMPEZXXi1WI5uhgywyptAMHa/pnjnqJYG8uWnAudUiJm5nfE8c2F+DBHW8ww
	RSX+f5tEYXXEF0OpVKywBdqzI7E46vpa6PlS4Xdqo12nIiV7hRGu4TgZTbs4mr8LN3St
	PyyyUodfSaXYxWvteLHEVeVrG4FshUdDhOFFowqK6TdQTiNDERepo1b2tjXZF9KOl4t0
	qLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0zhR5re1kUpsmkm9xtnAb/mAVfGZITz158tABkGImVk=;
	b=huSGfyC1co6Mw42z8Zvk8rR5Sw+648K5I+WtOQYlz5oKaDM3DQeZVrXTPgkoLSzHMS
	w66AtngFFiDOHIkNhdoU+ui5lMfQZfO00tJko1LaszZTbRKRVSE1kaZeGKbfSIDwiKq0
	lFt9ksiFjVKIUEwblgAzckEk1YrDdYdH8Wk0LULtKIJzd3Tu6LXALSO2y2NZOwIw2bWy
	8nK07PZAa5x8GOGDi7C0NXOwNU4V8o/cOh3pJgCWCl5oop43RTO+tofu4V4D1cGqTSr6
	2jLEa504gn8HusktatWO6Xe49az36NJFnajuk0jZMQbzqe6E+h/GJEf/WQIb8U0d/SdW
	96Fw==
X-Gm-Message-State: AJcUukchA6QPRdgKBGaiIcyDERJvtFJlKz9y392FUWMpNyWDq3fw78MO
	2KsCMIQAZzfPlLrALcTgWKmLxq0/wP7O1OTFaVU=
X-Google-Smtp-Source: ALg8bN6TXyZe2ujuB9h+yXgcVtbOKYL093hHHJnDa4v3IhSsgoEEIbuOOlyIGfd5NZ2af+Z6O0rl4czPAHtZGmZ3Cjo=
X-Received: by 2002:a9d:66f:: with SMTP id 102mr17838184otn.293.1548697085908; 
	Mon, 28 Jan 2019 09:38:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1548679462.git.alex.kanavin@gmail.com>
	<f26f729ae8292856bc3b1e73af1980fcb11d4972.1548679462.git.alex.kanavin@gmail.com>
	<e027d8fa4a0410d575fb9ff71833c13b626ba9db.camel@linuxfoundation.org>
In-Reply-To: <e027d8fa4a0410d575fb9ff71833c13b626ba9db.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Jan 2019 18:37:51 +0100
Message-ID: <CANNYZj_ziprqCNn09-SCVjUxvZphR4fQJqLv0X7COvxMkGD6Zw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/24] mesa-gl: do not enable nativesdk variant to avoid clashes with main mesa recipe
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
X-List-Received-Date: Mon, 28 Jan 2019 17:38:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Jan 2019 at 18:25, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> I really hate using remove in OE-Core. Lets find a different way to do
> this please as if we do this, its nearly impossible to undo in another
> layer...

Sure, I think moving 'BBCLASSEXTEND = "native nativesdk"' from
mesa.inc to mesa_*.bb should sort this.

Alex

