Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id AE6707ED5C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 08:16:44 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d16so2736208wre.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 00:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=X8mhDZUOPQgnJKTVotp0FpmMdGs0UNRgYLJ3DDocTPc=;
	b=ZQm7RzB30AVxromu3qJgGlYbNwjj7gBm83EkanyqAn2vu+dYFVapcOrjAOI5oVsRcx
	S7gQA75btwYMWmcP8wd+u+chQVK8QAyWPjmJcanj2rtOAUmcQspVq5M87xYuAy68cVI/
	9o+GDNU5WWu4s+x5HkSWf5XxqAF+8Geh1Frpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=X8mhDZUOPQgnJKTVotp0FpmMdGs0UNRgYLJ3DDocTPc=;
	b=VFe2N9gg+ridVS5qgVarKZgqpDSlgnuVWzrPc3NTY3bGdxhO66n489DN2lEW43tgcI
	LJSibZF7G+N741ACKvbMlR0CT0ie6gF1wQXIRqRf+ZwTyEN/wA3h6ihYlGz5QmVqwvon
	K3oz/LQNLtmqeWHegBJVDfjGigDwhlt7VDn5K8Lnx3BimNGpy7npV1h8GjSeVBVTMsg2
	sq627KlJgaDC/q1cDjJMO8fUL2d2SzgAhw+l4+jgRzdINMp+PnJm1qTo/4V5vTJWc7+V
	qLUfhqQ/IT5wrgXlqmV0VGEjlQ6r47f6WCIxfcWnvzVeZvJmiCD+6sSrViXcfQ8VhIPL
	Evzw==
X-Gm-Message-State: APjAAAV8qthtHXLcFm9IWjlLRQO/GM4yWoqsE9SOtr0xJfQBf9ivIHs5
	o5W5FGno7KoF/SUJXa7UB72E6g==
X-Google-Smtp-Source: APXvYqyHmWj9ElLGHnwD9bTK9/a/xk1OsxcCQcWKF6I91332CP7gVGNwsCVXdO2d2GEi80d6x46IHA==
X-Received: by 2002:adf:df90:: with SMTP id z16mr2656815wrl.273.1575447405310; 
	Wed, 04 Dec 2019 00:16:45 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f67sm5851067wme.16.2019.12.04.00.16.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Dec 2019 00:16:44 -0800 (PST)
Message-ID: <f2584b5129459354675042d78310a782c749ee57.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 04 Dec 2019 08:16:43 +0000
In-Reply-To: <fc362303-861c-8d71-9a4e-493c1444d977@windriver.com>
References: <1573547565-352904-1-git-send-email-changqing.li@windriver.com>
	<fc362303-861c-8d71-9a4e-493c1444d977@windriver.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] report-error.bbclass: replace angle brackets with &lt; and &gt;
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
X-List-Received-Date: Wed, 04 Dec 2019 08:16:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-12-04 at 08:25 +0800, Changqing Li wrote:
> ping

There was a reply from Paul Eggleton about the server side of this
patch, were those issues addressed?

Cheers,

Richard

> On 11/12/19 4:32 PM, changqing.li@windriver.com wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> > 
> > when we have below content in local.conf or auto.conf:
> > BUILDHISTORY_COMMIT_AUTHOR ?= "Khem Raj <raj.khem@gmail.com>"
> > send-error-report will fail with "HTTP Error 500: OK"
> > 
> > error-report-web do rudimentary check on all fields that are
> > passed to the graphs page to avoid any XSS happening, if contains
> > '<', the server will return error(Invalid characters in json).
> > fixed by use escape of <> to replace it.
> > 
> > NOTE: with this change, error-report-web need to add filter 'safe'
> > for the string wanted to display to avoid further HTML escaping
> > prior to output. Below is how the content displayed on webpage:
> > with the filter 'safe':
> > BUILDHISTORY_COMMIT_AUTHOR ?= "Khem Raj <raj.khem@gmail.com>"
> > without the filter 'safe':
> > BUILDHISTORY_COMMIT_AUTHOR ?= "Khem Raj &lt;raj.khem@gmail.com&gt;"
> > 
> > Another patch for error-report-web will send to yocto mail list.
> > 
> > [YOCTO #13252]
> > 
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >   meta/classes/report-error.bbclass | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/classes/report-error.bbclass
> > b/meta/classes/report-error.bbclass
> > index 1a12db1..6046867 100644
> > --- a/meta/classes/report-error.bbclass
> > +++ b/meta/classes/report-error.bbclass
> > @@ -36,6 +36,7 @@ def get_conf_data(e, filename):
> >                       continue
> >                   else:
> >                       jsonstring=jsonstring + line
> > +    jsonstring = jsonstring.replace("<", "&lt;").replace(">",
> > "&gt;")
> >       return jsonstring
> >   
> >   python errorreport_handler () {


