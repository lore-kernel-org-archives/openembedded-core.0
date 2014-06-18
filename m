Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id CBBCA6FE46
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 16:51:29 +0000 (UTC)
Received: (qmail 4486 invoked by uid 1003); 18 Jun 2014 16:51:30 -0000
Received: from unknown (HELO ?10.16.32.86?) (philip@opensdr.com@64.186.172.226)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	18 Jun 2014 16:51:30 -0000
Message-ID: <53A1C391.5040005@balister.org>
Date: Wed, 18 Jun 2014 09:51:29 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
References: <A7A7CE28-3393-4E94-BBFF-E29AA343678F@ettus.com>
In-Reply-To: <A7A7CE28-3393-4E94-BBFF-E29AA343678F@ettus.com>
X-Enigmail-Version: 1.6
X-Forwarded-Message-Id: <A7A7CE28-3393-4E94-BBFF-E29AA343678F@ettus.com>
Subject: [Discuss-gnuradio] CMake 3.0.0 is out ...
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
X-List-Received-Date: Wed, 18 Jun 2014 16:51:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

FYI.

Philip


-------- Original Message --------
Subject: [Discuss-gnuradio] CMake 3.0.0 is out ...
Date: Wed, 18 Jun 2014 08:05:33 -0400
From: Michael Dickens <michael.dickens@ettus.com>
To: Discuss-gnuradio@gnu.org List <discuss-gnuradio@gnu.org>

CMake 3.0.0 has lots of bug fixes from the last release (2.8.12), and it
also contains a number of policy changes.  The primary ones that effect
GNU Radio's build system are in (1) using a name before it is declared
(e.g., 'gnuradio-runtime', which is used for 'test-gnuradio-pmt' before
'gnuradio-runtime' is declared); and (2) trying to find the location of
a non-declared name (e.g., '/usr/bin/python' is not something in the
current build, and thus has no 'location' associated with it).  That
said: (1) None of the policy changes seem to effect the actual build or
anything else; they can be treated as warnings instead of errors.  (2)
The actual build still seems to work as it did before; CMake 3.0.0 seems
to be more of a new numbering rather than a major set of API changes.
So, mostly good news.  Since I'm working on updating the CMake build to
work more robustly, I'll see if I can fix these issues too. - MLD
_______________________________________________
Discuss-gnuradio mailing list
Discuss-gnuradio@gnu.org
https://lists.gnu.org/mailman/listinfo/discuss-gnuradio





