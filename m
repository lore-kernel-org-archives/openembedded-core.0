Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id D6D456FF64
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 03:08:18 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2; Thu, 3 Dec 2015
	04:08:18 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id F1D9B28FA82;
	Thu,  3 Dec 2015 04:08:18 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Dec 2015 04:08:17 +0100
Message-ID: <1449112097-7530-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCHv2 0/1] util-linux: Add ptest
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
X-List-Received-Date: Thu, 03 Dec 2015 03:08:19 -0000
Content-Type: text/plain

Difference from v1: rewrote run-ptest for better maintenability

Sample ptest output:
Sample ptest output:
root@qemuppc:/usr/lib/util-linux/ptest# ./run-ptest 

-------------------- util-linux regression tests --------------------

                    For development purpose only.                    
                 Don't execute on production system!                 

PASS:        bitops: swap bytes                    
SKIP:     build-sys: config                         (optional)
PASS:           cal: 1 month                       
PASS:           cal: 1 month with week numbers     
PASS:           cal: 3 months                      
PASS:           cal: 3 months with week numbers    
PASS:           cal: Year 2147483646               
PASS:           cal: Year 2147483646 with week numbers
PASS:           cal: color                         
PASS:           cal: color with week numbers       
PASS:           cal: September 1752                
PASS:           cal: September 1752 with week numbers
PASS:           cal: week number given as argument 
PASS:           cal: week number corner cases      
PASS:           cal: year                          
PASS:           cal: year with week numbers        
PASS:           col: multibyte input               
PASS:         colrm: basic check                   
PASS:        column: fill row                      
PASS:        column: invalid multibyte             
PASS:        column: multiple files                
PASS:        column: separator & table             
PASS:         dmesg: levels                        
PASS:         dmesg: decode                        
PASS:         dmesg: delta                         
PASS:         dmesg: facilities                    
SKIP:          fsck: is mounted                     (missing in PATH: mkfs.ext3)
      hexdump: format-strings                 ...
PASS:       hexdump: empty-format                  
PASS:       hexrandom: nonblocking pool is initialized
dump: 1b_octal                      
PASS:       hexdump: 1b_char                       
PASS:       hexdump: canon                         
PASS:       hexdump: 2b_dec                        
PASS:       hexdump: 2b_octal                      
PASS:       hexdump: 2b_hex                        
           ... OK (all 7 sub-tests PASSED)
      hexdump: highlighting                   ...
PASS:       hexdump: 1b_octal-1                    
PASS:       hexdump: 1b_octal-2                    
PASS:       hexdump: 1b_octal-3                    
PASS:       hexdump: 1b_octal-4                    
PASS:       hexdump: 1b_octal-5                    
PASS:       hexdump: 1b_octal-6                    
PASS:       hexdump: 1b_octal-7                    
PASS:       hexdump: 1b_octal-8                    
PASS:       hexdump: 1b_octal-9                    
PASS:       hexdump: 1b_char-1                     
PASS:       hexdump: 1b_char-2                     
PASS:       hexdump: 1b_char-3                     
PASS:       hexdump: canon-1                       
PASS:       hexdump: canon-2                       
PASS:       hexdump: 2b_dec-1                      
PASS:       hexdump: 2b_dec-2                      
PASS:       hexdump: 2b_dec-3                      
PASS:       hexdump: 2b_dec-4                      
PASS:       hexdump: 2b_dec-5                      
PASS:       hexdump: 2b_dec-6                      
PASS:       hexdump: 2b_dec-7                      
PASS:       hexdump: 2b_dec-8                      
PASS:       hexdump: 4b_dec-1                      
PASS:       hexdump: 4b_dec-2                      
PASS:       hexdump: 4b_dec-3                      
PASS:       hexdump: 4b_dec-4                      
PASS:       hexdump: 4b_dec-5                      
PASS:       hexdump: 4b_dec-6                      
PASS:       hexdump: 4b_dec-7                      
           ... OK (all 29 sub-tests PASSED)
SKIP:       hwclock: system to hw                   (missing in PATH: bc)
PASS:          ipcs: headers                       
SKIP:          ipcs: limits overflow                (missing in PATH: bc)
SKIP:          ipcs: basic limits                   (missing in PATH: bc)
PASS:          ipcs: mk-rm-msg                     
PASS:          ipcs: mk-rm-sem                     
PASS:          ipcs: mk-rm-shm                     
      isosize: print-size                     ...
PASS:         login: islocal                       
PASS:         login: defs                          
PASS:          look: separator                     
PASS:           md5:                               
PASS:          misc: fallocate                     
PASS:          misc: getopt                        
         misc: getopt2                        ...
PASS:          misc: alternative_option_clash      
PASS:          misc: alternative_option_long       
PASS:          misc: alternative_option_short      
PASS:          misc: invalid_getopt_option         
PASS:          misc: invocation_model_one          
PASS:          misc: invocation_model_three_as_one 
PASS:          misc: invocation_model_two_as_one   
PASS:          misc: invocation_without_parameters 
PASS:          misc: long_option_ambiguous_1       
PASS:          misc: longopts                      
PASS:          misc: name_option_long              
PASS:          misc: name_option_short             
PASS:          misc: quiet_option_long             
PASS:          misc: quiet_option_short            
PASS:          misc: quiet_output_option_long      
PASS:          misc: quiet_output_option_short     
PASS:          misc: same_long_short_options       
PASS:          misc: test_for_enhanced_getopt      
PASS:          misc: unknown_options               
PASS:          misc: unquoted_option_bash          
PASS:          misc: unquoted_option_tcsh          
PASS:          misc: weird_quoting_bash            
PASS:          misc: weird_quoting_tcsh            
           ... OK (all 23 sub-tests PASSED)
         misc: getopt3                        ...
PASS:          misc: compatible                    
PASS:          misc: sh                            
PASS:          misc: csh                           
PASS:          misc: no-arguments                  
PASS:          misc: posix_correctly               
PASS:          misc: non-option                    
           ... OK (all 6 sub-tests PASSED)
PASS:          misc: ionice                        
SKIP:          misc: line                           (line not found)
PASS:          misc: mcookie                       
PASS:          misc: rev                           
PASS:          misc: setarch                       
PASS:          misc: setsid                        
PASS:          misc: strtosize                     
FAIL:          misc: swaplabel                      (misc/swaplabel)
FAIL:          misc: ul                             (misc/ul)
PASS:          misc: whereis                       
PASS:          more: regexp                        
PASS:          more: squeeze                       
PASS:         namei: basic functionality           
FAIL:         paths: built-in                       (paths/built-in)
PASS:    schedutils: cpuset                        
SKIP:        script: race conditions                (optional)
SKIP:        swapon: by devname                     (no loop-device support)
SKIP:        swapon: fix page size                  (no loop-device support)
SKIP:        swapon: fix signature                  (no loop-device support)
SKIP:        swapon: by label                       (no loop-device support)
SKIP:        swapon: by uuid                        (no loop-device support)
PASS:         tailf: simple                        
root@qemuppc:/usr/lib/util-linux/ptest# 


Tudor Florea (1):
  util-linux: Add ptest

 meta/recipes-core/util-linux/util-linux.inc        | 31 +++++++++++-
 .../util-linux/avoid_parallel_tests.patch          | 19 ++++++++
 .../util-linux/avoid_unsupported_grep_opts.patch   | 57 ++++++++++++++++++++++
 .../util-linux/avoid_unsupported_sleep_param.patch | 20 ++++++++
 .../util-linux/display_testname_for_subtest.patch  | 18 +++++++
 .../recipes-core/util-linux/util-linux/ptest.patch | 17 +++++++
 meta/recipes-core/util-linux/util-linux/run-ptest  | 25 ++++++++++
 meta/recipes-core/util-linux/util-linux_2.26.2.bb  |  6 +++
 8 files changed, 192 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/avoid_unsupported_grep_opts.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/avoid_unsupported_sleep_param.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/ptest.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/run-ptest

-- 
1.9.1


