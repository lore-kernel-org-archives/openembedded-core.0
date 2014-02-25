Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 994CA6E7D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 13:24:23 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id t59so6827506yho.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 05:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=icG9edakjqxI5Gbi3VENChyywpqMd9qvxhBu8cIMNfI=;
	b=VpB6GoGFknY4itYFCTGZidRqJnFYlxbz1ezmwtz/oKdWPle5ZmcB7Iv3gmVNu/98Bc
	i6HJ3oZxTQjRKdTHqtxgqtUmpIhwesfBr9mL9l1oRPQAjNrdsb6izCBip6XhXkhD5ThQ
	2AtFsi/X0V2PX98xnmRxxhnY3vYUlZbdBOhM1mjKRhLUVC1GEzqTU2HEntOnu3e4QuSr
	H0jv5K43xmBFVHOmwnW768njpaUNnqjXiCAThvz9Q9j5wi1WYrQVrdH7ZtK2bbELYkXF
	5KwW9+RgWYL9N8RfyQ+vqwUa9F0A87tK2rU7EmL4vM3p18H+QlM74Tut5Jk9WpR7l82O
	757w==
MIME-Version: 1.0
X-Received: by 10.236.96.201 with SMTP id r49mr5984260yhf.33.1393334664838;
	Tue, 25 Feb 2014 05:24:24 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Tue, 25 Feb 2014 05:24:24 -0800 (PST)
In-Reply-To: <1393280958-18379-1-git-send-email-diego.sueiro@gmail.com>
References: <1393280958-18379-1-git-send-email-diego.sueiro@gmail.com>
Date: Tue, 25 Feb 2014 10:24:24 -0300
X-Google-Sender-Auth: x2m3rqviqQu90amfTA_KdqYHYqo
Message-ID: <CAP9ODKpGE22EOaUgqnaYGF47dsidsAF5_zFxUdNz=EzfSeQOWg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Diego Sueiro <diego.sueiro@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Tue, 25 Feb 2014 13:24:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 7:29 PM, Diego Sueiro <diego.sueiro@gmail.com> wrote:
> libQtUiTools.a and libQtUiToolsE.a needs to be installed on meta-toolchain-qt
> and meta-toolchain-qte respectively.
> Whitout this static library, compiling qt apps which needs uitools will fail.
>
> qt4[-embedded]-staticdev is the package that contains this library and is the
> only file in it.
>
> Since a static library is shipped, special attention regarding the lincese
> should be taken.
> Here is the main header (tools/designer/src/uitools/quiloader.h) license
> notes for uitools.
>
> /****************************************************************************
> **
> ** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
> ** Contact: http://www.qt-project.org/legal
> **
> ** This file is part of the Qt Designer of the Qt Toolkit.
> **
> ** $QT_BEGIN_LICENSE:LGPL$
> ** Commercial License Usage
> ** Licensees holding valid commercial Qt licenses may use this file in
> ** accordance with the commercial license agreement provided with the
> ** Software or, alternatively, in accordance with the terms contained in
> ** a written agreement between you and Digia.  For licensing terms and
> ** conditions see http://qt.digia.com/licensing.  For further information
> ** use the contact form at http://qt.digia.com/contact-us.
> **
> ** GNU Lesser General Public License Usage
> ** Alternatively, this file may be used under the terms of the GNU Lesser
> ** General Public License version 2.1 as published by the Free Software
> ** Foundation and appearing in the file LICENSE.LGPL included in the
> ** packaging of this file.  Please review the following information to
> ** ensure the GNU Lesser General Public License version 2.1 requirements
> ** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
> **
> ** In addition, as a special exception, Digia gives you certain additional
> ** rights.  These rights are described in the Digia Qt LGPL Exception
> ** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
> **
> ** GNU General Public License Usage
> ** Alternatively, this file may be used under the terms of the GNU
> ** General Public License version 3.0 as published by the Free Software
> ** Foundation and appearing in the file LICENSE.GPL included in the
> ** packaging of this file.  Please review the following information to
> ** ensure the GNU General Public License version 3.0 requirements will be
> ** met: http://www.gnu.org/copyleft/gpl.html.
> **
> **
> ** $QT_END_LICENSE$
>
> Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>

This license is the same of Qt itself so I don't think it needs to be
quoted here. Do you see any reason for it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

