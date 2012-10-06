Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TKWiB-0003CL-Bl
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Oct 2012 17:54:43 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so1824935eei.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Oct 2012 08:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ZIy4hEg06+692yx0TGgHk+RNdudBataSQwABVMD/wCE=;
	b=Rr5hVjFZ/KiSIJtmpr3UlHaNrdGUcdir4m3fIPO8Ufi9g0wteZ4jGNEB0kQvynLGCy
	Rx0lUleZTxll3WQbe4pHLCjuCvn2UWO9uUZ3NsF4n5hh1kxwazBeOpEjzHWxzWd5lS45
	Dcv2QbeeXabk8dgL0j/hPp7ShK0Fb63zjLYDttJ4dkBZyuQ9R7k9C6uT/u0tslfmK2Dp
	b47uCxcg9Qy7OnD8po1el7ccyub/AbTBWSCo64h0KyiNmWqpKMSynFZzeZYge32Ufh5Q
	a6o6JQKE37oC8iH8Uql0k8IZfZm47Fntl3WDAQc72SXvXkmqFyMAlDYf4qtO4QEnvjp5
	mFrA==
Received: by 10.14.200.134 with SMTP id z6mr16728811een.33.1349538099624; Sat,
	06 Oct 2012 08:41:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.66 with HTTP; Sat, 6 Oct 2012 08:41:09 -0700 (PDT)
In-Reply-To: <F0DDC3CE-D71C-4CBE-ACA4-B6E66DEDD4FC@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
	<8a3cf0ce40dbc72a43f08bfed56e61569fe7a910.1345518098.git.raj.khem@gmail.com>
	<48919519-8CA2-41A8-96EA-F5D7F91DE33F@gmail.com>
	<CAMKF1sou8jjkoktbC4J1O+b-KbxZ43MyF3aPq68S74p8wC_qwQ@mail.gmail.com>
	<C309CEF1-33E5-4DD0-BA0E-8414EB53802C@gmail.com>
	<CAMKF1srk7SJSGiCDztiyx71NJZUgG530=QbhYCMm88t6ndgSbw@mail.gmail.com>
	<F0DDC3CE-D71C-4CBE-ACA4-B6E66DEDD4FC@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Oct 2012 08:41:09 -0700
Message-ID: <CAMKF1sqJ==O+AO-Si-CWQSOoZZhppepLjVmjQnipiXuSHWXLMQ@mail.gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] gcc-cross: Make gcc-cross-initial as the only intermediate gcc stage
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
X-List-Received-Date: Sat, 06 Oct 2012 15:54:43 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 5, 2012 at 11:59 PM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
>
> I've narrowed down the init problem, to the application of the above patch,
> but I'm unable to figure out why it is failing. Any suggestions?
>

is it eglibc 2.13 ? or 2.16 one thing  I see is that it is disabling
ssp but otherwise it looks not to so much than changing eglibc to
use gcc-initial


