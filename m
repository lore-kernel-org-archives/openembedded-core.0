Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1SE009-0005EP-Tu
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 17:14:01 +0200
Received: by bkcjg15 with SMTP id jg15so1301700bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 08:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=Gfqtn3drdpz7SEaeB+NSMb3NIvBgh5yXX16yvfRJ9EY=;
	b=JqaWd5pIK5XYHN/ZreQvBAUDpiHzBL2vfm7IWoMW8imhDzetFf2c+N17HNCrz7Tms+
	jWL+KPO6R9ZTBY+y0rEYosLv33h65iSl7AiehXJ/jlL9GRRm9ullQ48ppsst+5rBfiUK
	i9Rc8NH/WShFJXlUoaMSBkfAwTSh1UXjswrb2WPRD+L9HtSFVaFG393uWj0mO7nTLSQ/
	XKymT+xNSqKqc4p3H2iDM8kGF7yLM050g6dfSrs87wOkPSS3vC+4HVZSFFX/z8XVePwt
	kGwej/05xuEViOr5KzBubR1VBYcSpxP2EOvN2bmxlmEd9nHQUwco5eDSXBmSHenMhyYg
	Ok9Q==
MIME-Version: 1.0
Received: by 10.204.150.86 with SMTP id x22mr939822bkv.136.1333206296007; Sat,
	31 Mar 2012 08:04:56 -0700 (PDT)
Received: by 10.204.36.8 with HTTP; Sat, 31 Mar 2012 08:04:55 -0700 (PDT)
X-Originating-IP: [74.41.60.154]
In-Reply-To: <1333202821.18082.225.camel@ted>
References: <1333202821.18082.225.camel@ted>
Date: Sat, 31 Mar 2012 08:04:55 -0700
Message-ID: <CAOSpxdYtrYctG3V=cKTvSPaNdimVDdP-MgCM0HQYdL3szAFVjg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQlqzSIz5w0mpEAKHjOOm8n3N+ka1yjZ5afTpwBlEV+QSARoyJMy3nWWKwQ+wSCTResEN1sT
Cc: "sanil.kumar" <sanil.kumar@huawei.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Re-execution of tasks - test report and results
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Mar 2012 15:14:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Mar 31, 2012 at 7:07 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> As some people have noticed, there are some rebuild issues happening due
> to sstate and the use of hashes in the stamp files. By this I mean the
> case where due to some checksum change, some task gets rerun and the
> task was not written to run a second time.

For the set of recipes I typically build with my autobuild script I
found it necessary to add code to do a -c cleansstate on the following
recipes:

shadow-native
boost
gcc
git
man-pages
net-tools
sqlite
wget

There seems to be a good amount of overlap with your list, but there
are a few that are not on your list.

Steve


