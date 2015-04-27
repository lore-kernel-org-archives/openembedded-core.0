Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E4FDE65CAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 16:13:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 27 Apr 2015 09:12:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,658,1422950400"; 
	d="scan'208,217";a="486244777"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.24.81])
	([10.219.24.81])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Apr 2015 09:12:44 -0700
Message-ID: <553E5FFC.2030203@linux.intel.com>
Date: Mon, 27 Apr 2015 11:12:44 -0500
From: Mariano Lopez <mariano.lopez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity.bbclass: Increased verbosity for connectivity check
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
X-List-Received-Date: Mon, 27 Apr 2015 16:13:12 -0000
Content-Type: multipart/alternative;
	boundary="------------070300090307010709090302"

--------------070300090307010709090302
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The connectivity sanity error doesn't tell you which URL failed to fetch 
nor how it failed.

This provides the URL that failed and why it failed using 
BBFetchException messages during the connectivity check.

Please disregard previous patch with the same topic.

[YOCTO #7592]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
  meta/classes/sanity.bbclass | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index cca39c9..f7e8212 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -278,12 +278,12 @@ def check_connectivity(d):
          try:
              fetcher = bb.fetch2.Fetch(test_uris, data)
              fetcher.checkstatus()
-        except Exception:
+        except Exception as err:
              # Allow the message to be configured so that users can be
              # pointed to a support mechanism.
              msg = data.getVar('CONNECTIVITY_CHECK_MSG', True) or ""
              if len(msg) == 0:
-                msg = "Failed to fetch test data from the network. 
Please ensure your network is configured correctly.\n"
+                msg = '%s. Please ensure your network is configured 
correctly.\n' % err
              retval = msg

      return retval
-- 
1.8.4.5


--------------070300090307010709090302
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-text-flowed" style="font-family: -moz-fixed;
      font-size: 12px;" lang="x-unicode">The connectivity sanity error
      doesn't tell you which URL failed to fetch nor how it failed.
      <br>
      <br>
      This provides the URL that failed and why it failed using
      BBFetchException messages during the connectivity check.<br>
      <br>
      Please disregard previous patch with the same topic.<br>
      <br>
      [YOCTO #7592]
      <br>
      <br>
      Signed-off-by: Mariano Lopez <a class="moz-txt-link-rfc2396E"
        href="mailto:mariano.lopez@linux.intel.com">&lt;mariano.lopez@linux.intel.com&gt;</a>
      <br>
      ---
      <br>
       meta/classes/sanity.bbclass | 4 ++--
      <br>
       1 file changed, 2 insertions(+), 2 deletions(-)
      <br>
      <br>
      diff --git a/meta/classes/sanity.bbclass
      b/meta/classes/sanity.bbclass
      <br>
      index cca39c9..f7e8212 100644
      <br>
      --- a/meta/classes/sanity.bbclass
      <br>
      +++ b/meta/classes/sanity.bbclass
      <br>
      @@ -278,12 +278,12 @@ def check_connectivity(d):
      <br>
               try:
      <br>
                   fetcher = bb.fetch2.Fetch(test_uris, data)
      <br>
                   fetcher.checkstatus()
      <br>
      -        except Exception:
      <br>
      +        except Exception as err:
      <br>
                   # Allow the message to be configured so that users
      can be
      <br>
                   # pointed to a support mechanism.
      <br>
                   msg = data.getVar('CONNECTIVITY_CHECK_MSG', True) or
      ""
      <br>
                   if len(msg) == 0:
      <br>
      -                msg = "Failed to fetch test data from the
      network. Please ensure your network is configured correctly.\n"
      <br>
      +                msg = '%s. Please ensure your network is
      configured correctly.\n' % err
      <br>
                   retval = msg
      <br>
      <br>
           return retval
      <br>
      <div class="moz-txt-sig"><span class="moz-txt-tag">-- <br>
        </span>1.8.4.5
        <br>
        <br>
      </div>
    </div>
  </body>
</html>

--------------070300090307010709090302--
